public with sharing class RecordFetcher {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> fetchRecords(List<String> recordIds, List<String> fieldNames) {
        List<Map<String, Object>> result = new List<Map<String, Object>>();

        if (recordIds.isEmpty() || fieldNames.isEmpty()) {
            System.debug('⚠️ Error: recordIds or fieldNames list is empty');
            return result;
        }

        if (!fieldNames.contains('Id')) {
            fieldNames.add(0, 'Id');
        }

        try {
            String queryString = 'SELECT ' + String.join(fieldNames, ', ') + ' FROM Account WHERE Id IN :recordIds';
            List<SObject> records = Database.query(queryString);

            for (SObject record : records) {
                Map<String, Object> recordMap = new Map<String, Object>();
                for (String field : fieldNames) {
                    if (record.get(field) != null) {
                        recordMap.put(field, record.get(field));
                    }
                }
                result.add(recordMap);
            }
        } catch (Exception e) {
            System.debug('⚠️ Error in fetchRecords: ' + e.getMessage());
        }

        return result;
    }
}