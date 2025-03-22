public with sharing class SchoolName {
    @auraEnabled(cacheable=true)
    public static String getName(Id recId){
        School__c n =  [SELECT name FROM School__C WHERE Id =: recId LIMIT 1];
        String name = n.Name;
        return Name;
    }
}