@isTest
public class OpportunityTriggerTest {
	@testSetup static void setup()
    {
        Account a1 = new Account(Name = 'Acc1');
        insert a1;
        Opportunity op1 = new Opportunity(Name = 'op1',StageName = 'Needs Analysis',CloseDate = System.today(),AccountId = a1.Id);
        insert op1;
        Opportunity op2 = new Opportunity(Name = 'op2',StageName = 'Perception Analysis',CloseDate = System.today(),AccountId = a1.Id);
        insert op2;
        Account a2 = new Account(Name = 'Acc2');
        insert a2;
        Opportunity op3 = new Opportunity(Name = 'op3',StageName = 'Closed Won',CloseDate = System.today(),AccountId = a2.Id);
        insert op3;
        Opportunity op4 = new Opportunity(Name = 'op4',StageName = 'Closed Won',CloseDate = System.today(),AccountId = a2.Id);
        insert op4;
    }
    
    public static testMethod void updateAccountTeam(){
        Opportunity op1 = [SELECT Name,LeadSource FROM Opportunity WHERE Name = 'op1'];
        Opportunity op2 = [SELECT Name,LeadSource FROM Opportunity WHERE Name = 'op2'];
        Opportunity op3 = [SELECT Name,LeadSource FROM Opportunity WHERE Name = 'op3'];
        Opportunity op4 = [SELECT Name,LeadSource FROM Opportunity WHERE Name = 'op4'];
        Account a1 = [SELECT Name,IsOppEligibleForClose__c FROM Account WHERE Name = 'Acc1'];
        op1.LeadSource = 'Web';
        update op1;
        a1.IsOppEligibleForClose__c = true;
        update a1;
        op2.LeadSource ='Web';
        op2.Amount = 1000000;
        update op2;
        task t = new Task(WhatId = op3.Id,Subject = 'Call');
        delete op3;
    }
}