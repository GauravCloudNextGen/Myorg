import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class OpportunityMassAction extends LightningElement {
    @api recordIds; // List of selected Opportunity IDs
    isLoading = true;

    connectedCallback() {
        console.log('Selected Record IDs:', this.recordIds);

        if (this.recordIds && this.recordIds.length > 0) {
            this.showToast('Selected Records', `Record IDs: ${this.recordIds.join(', ')}`, 'success');
        } else {
            this.showToast('No Records Selected', 'Please select at least one record.', 'warning');
        }

        this.isLoading = false;

        // Close the mass action modal
        setTimeout(() => {
            this.dispatchEvent(new CustomEvent('close'));
        }, 2000);
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}
