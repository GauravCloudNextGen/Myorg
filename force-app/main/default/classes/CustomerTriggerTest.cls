@isTest
public class CustomerTriggerTest {
	@testSetUp static void setup(){
        Account a1 = new Account(Name = 'a1');
        insert a1;
        Customer__c c1 = new Customer__c(Name = 'c1',Account__c = a1.Id,Account_Manager__c = a1.OwnerId);
        insert c1;
        Customer__c c2 = new Customer__c(Name = 'c1',Account__c = a1.Id,Account_Manager__c = '005dM00000B5nzSQAR');
        insert c2;
    }
    public static TestMethod void CustomerTest(){
        Customer__c c1 = [SELECT Name FROM Customer__c WHERE Name = 'c1' LIMIT 1];
        c1.Account_Manager__c = '005dM00000B5nzSQAR';
        update c1 ;
        delete c1;
    }
}