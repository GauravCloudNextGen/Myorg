import { LightningElement, api } from 'lwc';

export default class SelectedRecordsHandler extends LightningElement {
    @api recordIds = [];

    connectedCallback() {
        // Get the record IDs from URL parameters (for List View buttons)
        const params = new URLSearchParams(window.location.search);
        const recordIdParam = params.get('c__recordIds');

        if (recordIdParam) {
            this.recordIds = recordIdParam.split(','); // Convert comma-separated values to an array
        }

        if (this.recordIds.length > 0) {
            console.log('Selected Record IDs:', this.recordIds);
            alert('Selected Record IDs: ' + JSON.stringify(this.recordIds));
        } else {
            console.log('No records selected.');
            alert('No records selected.');
        }
    }
}
