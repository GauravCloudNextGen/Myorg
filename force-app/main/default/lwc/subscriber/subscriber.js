import { LightningElement } from 'lwc';
import { registerListener} from 'c/pubsub';

export default class Subscriber extends LightningElement {
    message = '';

    connectedCallback() {
        // Subscribe to the event when the component is inserted into the DOM
        registerListener('messageEvent', this.handleMessageEvent, this);
    }
    handleMessageEvent(payload) {
        this.message = payload; // Update the message with the payload from the event
        System.debug('Message received: ' + payload);
    }
}
