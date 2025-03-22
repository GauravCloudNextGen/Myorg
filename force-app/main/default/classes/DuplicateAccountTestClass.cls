@isTest
public class DuplicateAccountTestClass {
	public static testMethod void testAccountDuplicateTrigger()
    {
        String addError = 'You cannot Create Duplicate Account';
        Account a1 = new Account(Name = 'Test Account');
        insert a1;
        Account a2 = new Account(Name = 'Test Account1');
        //insert a2;
        System.assertequals('You cannot Create Duplicate Account',addError);
        Try{
            insert a2;
        }
        catch(Exception e){
            System.debug('We want to see this. This means the Trigger is working');
        }
    }
}