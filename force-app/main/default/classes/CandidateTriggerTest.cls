@isTest
public class CandidateTriggerTest {
	@TestSetup static void setup(){
        Candidate1__c c1 = new Candidate1__c(First_Name__c ='Gaurav',Last_Name__c ='Gaurav',Skills__c = 'Java,C++');
        insert c1;
    }
    public static TestMethod void Candidate(){
        Candidate1__c c1 = [SELECT First_Name__c,Skills__c FROM Candidate1__c WHERE First_Name__c='Gaurav'];
        c1.Skills__c = 'Java,C++,HTML';
        update c1;
    }
}