@isTest
public class BatchOpportunityRecordCountTest {
	@TestSetup static void setup(){
        
    }
    public static TestMethod void batch(){
        List<Opportunity>o = new List<Opportunity>();
        for(Integer i=1;i<=10;i++)
            {
                Opportunity o1 = new Opportunity(Name = 'Opportunity '+ i,CloseDate = System.Today(),StageName = 'Prospecting');
                o.add(o1);
            }
        insert o;
        Test.StartTest();
        BatchOpportunityRecordCount b = new BatchOpportunityRecordCount();
        Database.executeBatch(b,10);
        Test.stopTest();
    }
}