public class RecordNameApiUtil {
    public static String getRecordName(Id recordId, String objectApiName) {
        if (recordId == null || String.isBlank(objectApiName)) {
            return null;
        }

        // Validate object API name using Schema (optional, for safety)
        Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectApiName);
        if (sObjectType == null || recordId.getSObjectType() != sObjectType) {
            throw new IllegalArgumentException('Invalid object API name or Id mismatch: ' + objectApiName);
        }

        // Construct the REST API endpoint using System.URL.getOrgDomainUrl()
        String endpoint = System.URL.getOrgDomainUrl().toExternalForm() + 
                         '/services/data/v59.0/sobjects/' + objectApiName + '/' + recordId + 
                         '?fields=Name';

        // Set up the HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');

        // Send the request
        Http http = new Http();
        try {
            HttpResponse res = http.send(req);
            if (res.getStatusCode() == 200) {
                // Parse the JSON response
                Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                System.debug((String) jsonResponse.get('Name'));
                return (String) jsonResponse.get('Name');
            } else {
                System.debug('API Error: ' + res.getStatus() + ' - ' + res.getBody());
                return null;
            }
        } catch (Exception e) {
            System.debug('Callout failed: ' + e.getMessage());
            return null;
        }
    }
}