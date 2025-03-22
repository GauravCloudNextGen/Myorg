import { LightningElement , track , wire } from 'lwc';
import Name from '@salesforce/schema/Student__c.Name';
import Course__c from '@salesforce/schema/Student__c.Course__c';
import College__c from '@salesforce/schema/Student__c.College__c';
import Active__c from '@salesforce/schema/Student__c.Active__c';
import numberOfStud from '@salesforce/apex/StudentData.numberOfStud';
export default class Assignment4 extends LightningElement {
    @track number
    params='';
    inputNumber(event){
        this.number = parseInt(event.target.value, 10);
        console.log(this.number);
    }
    columns = [
        { label:'Name',fieldName:'Name' },
        { label:'Course',fieldName:'Course__c' },
        { label:'College', fieldName:'College__c'},
        {label:'Active',fieldName:'Active__c'}
    ];
    async showResult(event){
        this.params = await numberOfStud({ n : this.number});
    }
}