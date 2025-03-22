@isTest
public class HelloWorldTestClass {
	static testMethod void validateHelloWorld()
    {
        Account a = new Account(name = 'T1 Account');
        insert a;
        a = [SELECT hello__c FROM Account WHERE Id =:a.Id];
        System.assertEquals('World',a.Hello__c);
    }
}