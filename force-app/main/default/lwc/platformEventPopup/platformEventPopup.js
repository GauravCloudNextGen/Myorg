import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import PLATFORM_EVENT_CHANNEL from '@salesforce/messageChannel/platformEventChannel__c'; // Check if this API name is correct!

export default class PlatformEventSubscriber extends LightningElement {
    subscription = null;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        console.log('✅ LWC Loaded - Attempting to Subscribe to Platform Event');
        this.subscribeToEvent();
    }

    subscribeToEvent() {
        if (!this.messageContext) {
            console.error('❌ MessageContext is undefined, cannot subscribe!');
            return;
        }

        this.subscription = subscribe(
            this.messageContext,
            PLATFORM_EVENT_CHANNEL,
            (message) => {
                console.log("🎉 Platform Event Received: ", JSON.stringify(message));
            }
        );

        if (this.subscription) {
            console.log('✅ Successfully Subscribed to Platform Event');
        } else {
            console.error('❌ Subscription Failed');
        }
    }
}
