@isTest
public class CustomerProjectTest {
    @TestSetup static void setup(){
        Opportunity op1 = new Opportunity(Name = 'op1',StageName = 'Closed Won',CloseDate = System.Today(),Amount = 1000);
        insert op1;
        Customer_Project__c c1 = new Customer_Project__c(Name = 'c1',Opportunity__c = op1.Id,Status__c = 'Active');
        insert c1;
    }
    public static TestMethod void customerProject(){
        
    }
}