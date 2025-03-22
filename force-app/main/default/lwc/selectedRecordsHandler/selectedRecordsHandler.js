import { LightningElement, api } from 'lwc';

export default class SelectedRecordsHandler extends LightningElement {
    @api selectedRecordIds; // This will hold the selected record IDs passed from the list view

    connectedCallback() {
        if (this.selectedRecordIds && this.selectedRecordIds.length > 0) {
            console.log('Selected Record IDs:', this.selectedRecordIds);
        } else {
            console.log('No records selected.');
        }
    }
}