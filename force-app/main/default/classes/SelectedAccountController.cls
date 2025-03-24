@RestResource(urlMapping='/selectedAccounts/*')
global with sharing class SelectedAccountController {

    // This method handles the GET request to fetch account details by IDs
    // main changes
    @HttpGet
    global static String getSelectedAccounts() {
        // Get the selected IDs from the URL parameters
        // 2nd change
        RestRequest req = RestContext.request;
        String idsParam = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        system.debug('hi changes made using 1st    branch');
        system.debug('hi changes made using 2nd branch');
        // Split the comma-separated IDs into a list
        List<String> selectedIds = idsParam.split(',');
        
        // Query the Account records based on the selected IDs
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Id IN :selectedIds];

        // Prepare the result as a list of account names
        List<String> accountNames = new List<String>();
        for (Account acc : accounts) {
            accountNames.add(acc.Name);
        }

        // Return the names as a JSON response
        return JSON.serialize(accountNames);
    }
}