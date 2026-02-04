import { LightningElement, track } from 'lwc';
import fetchWrapperRecords from '@salesforce/apex/WrapperRecordFetcher.fetchWrapperRecords';

export default class WrapperDataTable extends LightningElement {
    @track records = [];
    error;

    columns = [
        { label: 'Record ID', fieldName: 'recordId', type: 'text' },
        { label: 'Name', fieldName: 'name', type: 'text' },
        { label: 'Industry', fieldName: 'industry', type: 'text' }
    ];

    // Fetch records from Apex
    loadRecords() {
        fetchWrapperRecords()
            .then(result => {
                this.records = result;
                console.log(this.records);
                this.error = undefined;
            })
            .catch(error => {
                this.error = 'Error loading records';
                console.error('Error fetching wrapper records:', error);
            });
    }
}