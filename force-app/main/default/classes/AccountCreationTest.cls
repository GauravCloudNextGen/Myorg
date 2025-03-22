@isTest
public class AccountCreationTest {
    @TestSetup static void setup(){
        
    }
    Public static TestMethod void acc(){
        AccountCreation a1 = new AccountCreation();
        a1.CreateAccount('Gaurav','1222',2);
    }
}