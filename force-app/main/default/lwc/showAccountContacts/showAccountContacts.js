import { MessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import Gaurav from '@salesforce/messageChannel/Gaurav__c';
import getAccountContacts from '@salesforce/apex/ProjectAccount.getAccountContacts';
export default class ShowAccountContacts extends LightningElement {
    subscription = null;
    title = 'Contacts'
    @wire(MessageContext) messageContext;
    accountId;
    accountName;
    contacts;
    hasContacts = false;
    connectedCallback() {
        this.handleSubscribe();
    }

    disconnectedCallback() {
        this.handleUnsubscribe();
    }

    handleSubscribe() {
        if (!this.subscription) {
            this.subscription = subscribe(this.messageContext, Gaurav,
                (parameter) => {
                    this.accountId = parameter.accountId;
                    this.accountName = parameter.accountName;
                    this.title = this.accountName + " 's Contacts";
                    this.getContacts();
                }
            );
        }
    }
    async getContacts() {
        this.contacts = await getAccountContacts({ acId: this.accountId });
        this.hasContacts = this.contacts.length > 0 ? true : false;
    }
    handleUnsubscribe() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }
}