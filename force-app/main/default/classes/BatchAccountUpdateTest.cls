@isTest
public class BatchAccountUpdateTest {
    @TestSetup static void setup(){
        
    }
    public static TestMethod void batch(){
        List<Account>a = new List<Account>();
        for(Integer i=1;i<=10;i++)
            {
                Account a1 = new Account(Name = 'Account '+ i);
                a.add(a1);
            }
        insert a;
        Test.StartTest();
        BatchAccountUpdate b = new BatchAccountUpdate();
        Database.executeBatch(b);
        Test.stopTest();
    }
}