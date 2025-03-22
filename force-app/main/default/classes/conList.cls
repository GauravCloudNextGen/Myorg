public with sharing class conList {
    @AuraEnabled(cacheable=true)
    public static List<contact> getContacts(){
        List<contact>con = [SELECT Name FROM Contact LIMIT 10];
        return con;
    }
}