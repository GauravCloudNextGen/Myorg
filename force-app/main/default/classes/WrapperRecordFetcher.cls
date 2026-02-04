public with sharing class WrapperRecordFetcher {
    
    // Wrapper class to hold structured record data
    public class RecordWrapper {
        @AuraEnabled public String recordId;
        @AuraEnabled public String name;
        @AuraEnabled public String industry;

        public RecordWrapper(SObject record) {
            this.recordId = (String) record.get('Id');
            this.name = (String) record.get('Name');
            this.industry = (String) record.get('Industry');
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<RecordWrapper> fetchWrapperRecords() {
        List<RecordWrapper> result = new List<RecordWrapper>();

        try {
            List<Account> records = [SELECT Id, Name, Industry FROM Account LIMIT 5];

            for (Account record : records) {
                result.add(new RecordWrapper(record));
            }
        } catch (Exception e) {
            System.debug('⚠️ Error in fetchWrapperRecords: ' + e.getMessage());
        }
		System.debug(result);
        return result;
    }
}