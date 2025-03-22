public with sharing class Message {
	@AuraEnabled(cacheable=true)
    public static String getInputMessage(){
        return 'Gaurav';
    }
}