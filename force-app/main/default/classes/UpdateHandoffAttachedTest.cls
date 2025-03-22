@isTest
public class UpdateHandoffAttachedTest {
    @TestSetup static void setup(){
        Opportunity op1 = new Opportunity(Name = 'op1',StageName = 'Closed Won',CloseDate = System.Today(),Amount = 1000);
        insert op1;
        Top_X_Designation__c t1 = new Top_X_Designation__c(Name = 't1',Opportunity__c = op1.Id,Type__c = 'Contract Flow Down/Handoff',Document_Attached__c = True);
        insert t1;
        Opportunity op2 = new Opportunity(Name = 'op2',StageName = 'Closed Won',CloseDate = System.Today(),Amount = 1000);
        insert op2;
        Top_X_Designation__c t2 = new Top_X_Designation__c(Name = 't2',Opportunity__c = op2.Id,Type__c = 'Contract Flow Down/Handoff',Document_Attached__c = False);
        insert t2;
        delete t2;
    }
    public static TestMethod void Handoff(){
        
    }
}