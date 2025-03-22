import { LightningElement, api } from 'lwc';
import getData from '@salesforce/apex/StudentData.getData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Name from '@salesforce/schema/Student__c.Name';
import Class from '@salesforce/schema/Student__c.Class__c';
import Age from '@salesforce/schema/Student__c.Age__c';
import Email from '@salesforce/schema/Student__c.Email__c';
import { refreshApex } from '@salesforce/apex';
import deleteRecords from '@salesforce/apex/StudentData.deleteRecords';
export default class Assignment2 extends LightningElement {
    SchoolId = '';
    refreshTable;
    filter = '';
    ClassId = '';
    params = '';
    editRecord = false;
    create = false;
    @api recordId;
    selectedRecords = [];
    displayInfoSchool = {
        primaryField: 'Name'
    };

    displayInfoClass = {
        primaryField: 'Name'
    };
    // getSelectedRecord(event) {
    //     const selectedRows = event.detail.selectedRows;
    //     this.selectedRecords = new Array();
    //     for (let i = 0; i < selectedRows; i++) {
    //         this.selectedRecords.push(selectedRows[i]);
    //     }
    // }
    deleteRec() {
        if (this.selectedRecords) {
            deleteRecords({ studentList: this.selectedRecords })
                .then(result => {
                    const event = new ShowToastEvent({
                        title: "SUCCESS!",
                        message: "Record has been Deleted.",
                        variant: "success"
                    })
                    this.dispatchEvent(event);
                    this.template.querySelector('lightning-datatable').selectedRecords = [];
                    refreshApex(this.refreshTable);
                });
        }
    }
    handleChangeSchool(event) {
        console.log(event.detail);
        this.SchoolId = event.detail.recordId;
        this.filter = {
            criteria: [
                {
                    fieldPath: 'School__c',
                    operator: 'eq',
                    value: this.SchoolId
                }
            ]
        };
    }
    async handleChangeClass(event) {
        this.ClassId = event.detail.recordId;
        console.log(this.ClassId);
        this.params = await getData({ recId: this.ClassId });
        console.log(this.params);
        //@wire(getData,{recId : '$this.ClassId'}) params;
    }
    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Class', fieldName: 'Class__c' },
        { label: 'Age', fieldName: 'Age__c' },
        { label: 'Email', fieldName: 'Email__c' },
        {
            label: 'Actions',
            type: 'button',
            typeAttributes: { label: 'Edit', value: 'edit_user' }
        }
    ];

    handleRowAction(event) {
        if (event.detail.action.value === 'edit_user') {
            refreshApex(this.params);
            this.editRecord = true;
            this.recordId = event.detail.row.Id;
        }
    }
    handleRowSelection(event) {
        const selectedRow = event.detail.selectedRows;
        this.selectedRecords = new Array();
        for (let i = 0; i < selectedRow.length; i++) {
            console.log('hi ' + selectedRow[i]);
            this.selectedRecords.push(selectedRow[i]);
        }
    }
    hideModalBox() {
        this.editRecord = false;
        this.create = false;
    }
    handleSubmit() {
        if (this.recordId != null) {
            refreshApex(this.params);
            this.editRecord = false;
            this.dispatchEvent(new ShowToastEvent({
                title: "SUCCESS!",
                message: "Record has been Updated.",
                variant: "success"
            }),
            );
        }
    }
    handleSuccess() {
        this.create = false;
        this.dispatchEvent(new ShowToastEvent({
            title: "SUCCESS!",
            message: "Record has been Created.",
            variant: "success"
        }),
        );
    }
    createRecord() {
        this.create = true;
    }
    fields = [Name, Age, Email];
    selectedFields = [Name, Age, Email, Class];
}