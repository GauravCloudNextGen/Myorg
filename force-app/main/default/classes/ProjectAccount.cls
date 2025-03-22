public with sharing class ProjectAccount {
    @auraEnabled(cacheable=true)
    public static List<Account> getAccounts(String name){
        System.debug('🔵 getAccounts Called with Name: ' + name); 
        if(String.isBlank(name))
        {
            return [SELECT Id,Name FROM Account LIMIT 10];
        }
        else{
            name = '%'+name+'%';
            return [SELECT Id,Name FROM Account WHERE Name LIKE:name];
        }
    }
    @auraEnabled(cacheable=true)
    public static List<Contact> getAccountContacts(Id acId){
        return [SELECT Id,Name FROM Contact WHERE AccountId = : acId];
    }
}