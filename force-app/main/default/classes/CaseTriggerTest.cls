@isTest
public class CaseTriggerTest {
	@TestSetup static void setup(){
        Account a1 = new Account(Name = 'a1');
        insert a1;
        Case c1 = new Case(AccountId = a1.Id,Status = 'Closed',Origin = 'Web');
        insert c1;
        Account a2 = new Account(Name = 'a2');
        insert a2;
        Case c2 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c3 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c4 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        insert c2;
        insert c3;
        insert c4;
        Account a3 = new Account(Name = 'a3');
        insert a3;
        Case c5 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c6 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c7 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c8 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        Case c9 = new Case(AccountId = a2.Id,Status = 'Closed',Origin = 'Web');
        insert c5;
        insert c6;
        insert c7;
        insert c8;
        insert c9;
    }
    Public static TestMethod void caseTest(){
        Account a1 = [SELECT Id FROM Account WHERE Name = 'a2'];
        Case c1 = [SELECT Origin FROM Case WHERE AccountId = :  a1.Id LIMIT 1];
        c1.Origin = 'Email';
        update c1;
        delete c1;
    }
}