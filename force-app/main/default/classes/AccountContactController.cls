public with sharing class AccountContactController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accountId) {
        return [SELECT Id, Name FROM Contact WHERE AccountId = :accountId];
    }
}