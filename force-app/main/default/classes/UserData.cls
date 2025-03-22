public with sharing class UserData {
    @AuraEnabled(Cacheable=true)
    public static List<user> userInfo(){
        return [SELECT Id,Name,Username,IsActive,Email FROM User];
    }
}