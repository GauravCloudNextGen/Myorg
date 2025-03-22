import { LightningElement, api, wire } from 'lwc';
import getAccounts from '@salesforce/apex/ProjectAccount.getAccounts';
import { MessageContext, publish } from 'lightning/messageService';
import Gaurav from '@salesforce/messageChannel/Gaurav__c';

export default class AccountChild2 extends LightningElement {
    @api searchTextChild2 = '';
    accountsData = [];

    connectedCallback() {
        this.fetchAccounts();
    }

    @wire(getAccounts, { name: '$searchTextChild2' })
    wiredAccounts({ data, error }) {
        console.log('🔵 Apex Called with:', `"${this.searchTextChild2}"`);
        if (data) {
            console.log(' Accounts fetched:', JSON.stringify(data));
            this.accountsData = data;
        } else if (error) {
            console.error(' Error fetching accounts:', JSON.stringify(error));
            this.accountsData = [];
        }
    }

    fetchAccounts() {
        this.searchTextChild2 = ' ';
    }

    @wire(MessageContext) messageContext;

    columns = [
        { label: 'Id', fieldName: 'Id' },
        { label: 'Name', fieldName: 'Name' },
        { 
            label: 'Actions', 
            type: 'button', 
            typeAttributes: { label: 'View Contact', value: 'view_contact' } 
        }
    ];

    handleRowAction(event) {
        if (event.detail.action.value === 'view_contact') {
            const payload = {
                accountId: event.detail.row.Id,
                accountName: event.detail.row.Name
            };

            publish(this.messageContext, Gaurav, payload);
        }
    }
}