import { LightningElement, api } from 'lwc';

export default class ListViewButton extends LightningElement {
    @api recordIds; // Salesforce automatically passes selected record IDs

    connectedCallback() {
        console.log('Selected Record IDs:', this.recordIds);
        alert('Selected Record IDs: ' + JSON.stringify(this.recordIds)); // Show in alert box
    }
}