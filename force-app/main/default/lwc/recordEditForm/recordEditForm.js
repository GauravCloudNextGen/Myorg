import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type';
export default class RecordEditForm extends LightningElement {
    accountName = ACCOUNT_NAME;
    accountType = ACCOUNT_TYPE;
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'User created',
            message: 'User Created Successfully',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}