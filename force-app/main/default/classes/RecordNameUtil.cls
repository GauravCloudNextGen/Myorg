public class RecordNameUtil {
    public static String getRecordName(Id recordId, String objectApiName) {
        if (recordId == null || String.isBlank(objectApiName)) {
            return null;
        }

        Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectApiName);
        if (sObjectType == null || recordId.getSObjectType() != sObjectType) {
            throw new IllegalArgumentException('Invalid object API name or Id mismatch: ' + objectApiName);
        }

        // Hypothetical: Assume record is in memory somehow
        SObject record = sObjectType.newSObject(recordId);
        Account n = [SELECT Id,Name FROM Account WHERE Id =: recordId];
        String name = (String) record.get('Name'); // Still null without fetch
        System.debug(name);
        System.debug(n.name);
        return name;
    }
}