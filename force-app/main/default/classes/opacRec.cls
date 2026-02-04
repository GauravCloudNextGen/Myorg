public with sharing class opacRec {
    @auraEnabled
    public static List<opportunity_product_Amount_calculation__c> getData(Id recId){
        return [SELECT Id,Product__c,min__c,Max__c,Price__c FROM opportunity_product_Amount_calculation__c WHERE Product__c!=null AND Product__c = : recId];
    }
}