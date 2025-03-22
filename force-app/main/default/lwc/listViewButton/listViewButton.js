import { LightningElement, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

export default class ListViewButton extends LightningElement {
    @track opportunities = [];
    @track selectedRecords = [];

    // Wire method to fetch Opportunities from Apex
    @wire(getOpportunities)
    wiredOpportunities({ error, data }) {
        if (data) {
            this.opportunities = data;
        } else if (error) {
            console.error('Error fetching opportunities:', error);
        }
    }

    // Capture selected records
    handleRowSelection(event) {
        this.selectedRecords = event.detail.selectedRows.map(row => row.Id);
    }

    // Handle button click
    handleProcessRecords() {
        if (this.selectedRecords.length === 0) {
            this.showToast('Error', 'Please select at least one record.', 'error');
        } else {
            console.log('Selected Record IDs:', this.selectedRecords);
            this.showToast('Success', `Processing ${this.selectedRecords.length} records.`, 'success');

            // Call Apex method or navigate to another page if needed
        }
    }

    // Show toast message
    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}