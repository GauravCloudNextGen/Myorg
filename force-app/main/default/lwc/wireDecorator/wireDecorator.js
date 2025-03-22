import { LightningElement, api, wire } from 'lwc';
import getInputMessage from '@salesforce/apex/Message.getInputMessage';

export default class WireDecorator extends LightningElement {
    @api inputMessage = "world";

    @wire(getInputMessage)
    wiredMessage({ error, data }) {
        if (data) {
            this.inputMessage = data;
        } else if (error) {
            console.error('Error fetching message:', error);
        }
    }

    handleChange(event) {
        console.log('event.target.value:', event.target.value);
        this.inputMessage = event.target.value; 
    }
}