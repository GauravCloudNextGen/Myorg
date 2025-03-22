@isTest
public class Acc_Con_Opty_CreationTest {
	@TestSetup static void setup(){
        
    }
    Public static TestMethod void accountCreate(){
       Acc_Con_Opty_Creation a = new Acc_Con_Opty_Creation();
       a.CreateAccount();
    }
}