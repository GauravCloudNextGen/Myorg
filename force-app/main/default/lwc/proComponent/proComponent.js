import { LightningElement, track, wire } from 'lwc';
import fetchRecords from '@salesforce/apex/RecordFetcher.fetchRecords';

export default class DualDropdown extends LightningElement {
    // Dropdown values
    leftValue = '';
    rightValue = '';

    leftOptions = [
        { label: 'Left Option 1', value: 'leftOption1' },
        { label: 'Left Option 2', value: 'leftOption2' },
        { label: 'Left Option 3', value: 'leftOption3' }
    ];

    rightOptions = [
        { label: 'Right Option 1', value: 'rightOption1' },
        { label: 'Right Option 2', value: 'rightOption2' },
        { label: 'Right Option 3', value: 'rightOption3' }
    ];

    // Record and field inputs
    recordIds = '';
    fieldNames = '';

    // Table data
    @track records = [];
    @track columns = [];
    @track selectedRecords = [];

    // Handle dropdown changes
    handleLeftDropdownChange(event) {
        this.leftValue = event.detail.value;
    }

    handleRightDropdownChange(event) {
        this.rightValue = event.detail.value;
    }

    // Handle record ID and field inputs
    handleRecordIdsChange(event) {
        this.recordIds = event.target.value;
    }

    handleFieldNamesChange(event) {
        this.fieldNames = event.target.value;
    }

    // Fetch records dynamically
    fetchRecords() {
        if (this.leftValue === '' || this.rightValue === '' || this.recordIds === '' || this.fieldNames === '') {
            alert('Please fill all fields');
            console.error('Please fill all fields');
            return;
        }
        else {
            const idsArray = this.recordIds.split(',').map(id => id.trim());
            const fieldsArray = this.fieldNames.split(',').map(field => field.trim());
            if (idsArray.length && fieldsArray.length) {
                fetchRecords({ recordIds: idsArray, fieldNames: fieldsArray })
                    .then(result => {
                        if (!result || result.length === 0) {
                            console.error("No records found or response is undefined");
                            this.records = [];
                            return;
                        }

                        // Store records and make ID clickable
                        this.records = result.map(record => ({
                            ...record,
                            recordLink: '/' + record.Id
                        }));

                        // Create table columns dynamically
                        this.columns = [
                            {
                                label: 'Record Id',
                                fieldName: 'recordLink',
                                type: 'url',
                                typeAttributes: { label: { fieldName: 'Id' }, target: '_blank' }
                            },
                            ...fieldsArray.filter(field => field !== 'Id').map(field => ({
                                label: field,
                                fieldName: field,
                                type: 'text'
                            }))
                        ];
                    })
                    .catch(error => {
                        console.error("Error fetching records:", JSON.stringify(error));
                        this.records = []; // Reset records if error occurs
                    });
            }
        }
    }


    // Capture selected rows
    handleRowSelection(event) {
        this.selectedRecords = event.detail.selectedRows;
    }

    // Print JSON
    printSelectedIds() {
        const outputJson = {
            leftDropdown: this.leftValue,
            rightDropdown: this.rightValue,
            selectedRecords: this.selectedRecords.map(({ recordLink, ...rest }) => rest)
        };
        console.log(JSON.stringify(outputJson, null, 2));
        alert('Check Console for JSON Output');
    }
}