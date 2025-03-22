@isTest
public class LeadTriggerTest {
	@testSetup static void setup(){
        Lead l1 = new lead(lastName = 'lead1',email = 'bond_john@grandhotels.com',Company = 'New');
        insert l1;
        Contact c1 = new Contact(LastName='c1',email ='bond_john@grandhotels.com');
        insert c1;
    }
    public static testMethod void updatelead(){
        lead l1 = [SELECT Name,email FROM Lead WHERE Name = 'lead1'];
        l1.Company = 'Old';
        try{
            update l1;
        }
        catch(Exception e){
            System.debug('Email already Exists');
        }
    }
}