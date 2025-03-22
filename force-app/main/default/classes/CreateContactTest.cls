@isTest
public class CreateContactTest {
	public static testMethod void createContact()
    {
        Account a = new Account(Name ='ContactqqqqBytest',NumberofLocations__c = 2);
        insert a;
    }
}