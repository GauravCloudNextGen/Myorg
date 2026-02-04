public with sharing class PlatformEventPublisher {
    public PageReference publishEvent() {
        System.debug('🔥 Attempting to fire Platform Event...');

        // Create a simple Platform Event message
        CustomEvent__e eventMessage = new CustomEvent__e(
            Record_Id__c = 'TEST_123',
            Message__c = '🚀 Simple Test Event Fired'
        );

        // Publish the event
        Database.SaveResult result = EventBus.publish(eventMessage);
        System.debug('✅ EventBus.publish result: ' + result.isSuccess());

        // Check if there were errors
        if (!result.isSuccess()) {
            for (Database.Error error : result.getErrors()) {
                System.debug('❌ Error publishing event: ' + error.getMessage());
            }
        } else {
            System.debug('🎉 Platform Event successfully fired!');
        }

        return null;
    }
}