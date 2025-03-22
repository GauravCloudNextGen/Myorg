public with sharing class StudentData {
    @auraEnabled(cacheable=true)
    public static List<Student__c> getData(Id recId){
        return [SELECT Name,Class__c,Age__c,Email__c FROM Student__c WHERE Class__c=:recId];
    }

    @AuraEnabled
    public static void deleteRecords(List<Student__c> studentList){
        delete studentList;
    }
    @auraEnabled(cacheable=true)
    public static List<Student__c> numberOfStud(Integer n){
        return [SELECT Id,Name,Course__c,College__c,Active__c FROM Student__c  LIMIT :  n];
    } 
}