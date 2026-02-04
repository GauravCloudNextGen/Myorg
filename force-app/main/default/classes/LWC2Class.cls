public with sharing class LWC2Class {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountName(){
        return [SELECT Id,Name FROM Account LIMIT 10];
    }

}