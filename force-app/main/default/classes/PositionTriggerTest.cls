@isTest
public class PositionTriggerTest {
    @TestSetup static void setup(){
        Position__c p1 = new Position__c(Name='p1',status__c='New Position');
        insert p1;
    }
    Public static TestMethod void PositionTest(){
        
    }
}