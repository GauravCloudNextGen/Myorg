import { LightningElement } from 'lwc';
import { fireEvent } from 'c/pubsub';

export default class Publisher extends LightningElement {
    handleButtonClick() {
        const message = 'Hello from Publisher';
        fireEvent('messageEvent', message); // Fire the event
    }
}
