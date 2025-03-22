import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountContactController.getAccounts';
import getContacts from '@salesforce/apex/AccountContactController.getContacts';

export default class AccountContactLookup extends LightningElement {
    @track records = []; // Stores Accounts or Contacts
    @track selectedAccount; // Stores selected Account
    @track selectedContact; // Stores selected Contact
    @track showDropdown = false; // Controls dropdown visibility
    @track searchKey = ''; // Stores input text
    @track isShowingContacts = false; // Tracks if lookup is showing Contacts

    // Fetch Accounts initially
    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        if (data) {
            this.records = data;
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }

    // Fetch Contacts when an Account is selected
    fetchContacts(accountId) {
        getContacts({ accountId })
            .then(result => {
                this.records = result;
                this.isShowingContacts = true; // Switch to showing Contacts
                this.showDropdown = true;
            })
            .catch(error => {
                console.error('Error fetching contacts:', error);
            });
    }

    // Handle input field click (shows dropdown)
    handleInputClick() {
        this.showDropdown = true;
    }

    // Handle record selection (Account or Contact)
    handleRecordSelect(event) {
        event.preventDefault();
        const recordId = event.currentTarget.dataset.id;
        const recordName = event.currentTarget.dataset.name;

        if (!this.isShowingContacts) {
            // Selecting an Account → Load its Contacts
            this.selectedAccount = { Id: recordId, Name: recordName };
            this.searchKey = recordName;
            this.showDropdown = false;
            this.fetchContacts(recordId);
        } else {
            // Selecting a Contact → Final selection
            this.selectedContact = { Id: recordId, Name: recordName };
            this.searchKey = recordName;
            this.showDropdown = false;
        }
    }

    // Reset selection
    handleReset() {
        this.selectedAccount = null;
        this.selectedContact = null;
        this.isShowingContacts = false;
        this.searchKey = '';
        this.showDropdown = false;
        this.wiredAccounts(); // Reload Accounts
    }

    // ✅ Getter to replace ternary expression in HTML
    get recordTypeLabel() {
        return this.isShowingContacts ? '(Contact)' : '(Account)';
    }
}