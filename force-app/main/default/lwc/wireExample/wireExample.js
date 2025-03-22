import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire, api } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';

export default class WireExample extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_NAME, ACCOUNT_PHONE] }) 
    accounts;

    get getAccountName() {
        if (this.accounts.data) {
            console.log('hi');
            console.log(ACCOUNT_NAME);
            console.log(this.accounts.data);
            return getFieldValue(this.accounts.data, ACCOUNT_NAME);
        } else if (this.accounts.error) {
            return this.accounts.error;
        }
    }

    get getAccountPhone() {
        if (this.accounts.data) {
            console.log('hi');
            console.log(this.accounts.data);
            return getFieldValue(this.accounts.data, ACCOUNT_PHONE);
        } else if (this.accounts.error) {
            return this.accounts.error;
        }
    }
}