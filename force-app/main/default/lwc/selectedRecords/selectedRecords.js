import { LightningElement, track } from 'lwc';

export default class SelectedRecords extends LightningElement {
    @track recordIds = [];

    connectedCallback() {
        const urlParams = new URLSearchParams(window.location.search);
        const recordIdString = urlParams.get('c__recordIds'); // Extract record IDs from URL
        
        console.log('Extracted Record IDs:', recordIdString); // Debugging Log

        if (recordIdString) {
            this.recordIds = recordIdString.split(','); // Convert CSV to array
            console.log('Parsed Record IDs:', this.recordIds); // Debugging Log
        }
    }
}