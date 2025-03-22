import { LightningElement, api } from 'lwc';

export default class DisplaySelectedAccounts extends LightningElement {
    @api selectedIds;  // To hold the passed selected Account IDs

    // Method to open modal (You can use standard modal functionality)
    openModal() {
        const modal = this.template.querySelector('.modal');
        modal.style.display = 'block';
    }

    // Method to close modal
    closeModal() {
        const modal = this.template.querySelector('.modal');
        modal.style.display = 'none';
    }
}
