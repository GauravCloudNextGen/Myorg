public class CheckFields {
   /* public static void showLeadFields() {
        // Get info about the Lead object
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Position__c.fields.getMap();
        
        // Print all field names
        for (String fieldName : fieldMap.keySet()) {
            System.debug('Field: ' + fieldName);
        }
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
		Schema.SObjectType accountType = globalDescribe.get('Account');
		System.debug('Account Describe: ' + accountType);
        
        Schema.DescribeSObjectResult describeResult = Schema.SObjectType.Account.getDescribe();
		System.debug('Label: ' + describeResult.getLabel());
		System.debug('Is Createable: ' + describeResult.isCreateable());
    }*/

        public void dynamicQuery(String objectName) {
    // Get the sObject type dynamically
    Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectName);
    if (objType == null) {
        System.debug('Invalid object name');
        return;
    }

    // Get field map
    Map<String, Schema.SObjectField> fieldMap = objType.getDescribe().fields.getMap();
    String query = 'SELECT ';
    for (String fieldName : fieldMap.keySet()) {
        if (fieldMap.get(fieldName).getDescribe().isAccessible()) {
            query += fieldName + ', ';
        }
    }
    query = query.removeEnd(', ') + ' FROM ' + objectName + ' LIMIT 1';
	System.debug(query);
    // Execute dynamic query
    sObject record = Database.query(query);
    System.debug('Record: ' + record);
}

}