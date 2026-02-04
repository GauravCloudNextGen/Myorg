@IsTest
private class OpportunityTriggerHandlerTest {
    @TestSetup
    static void setupData() {
        // Minimal Account required for Opportunity
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Base Opportunity (CloseDate intentionally left null for insert scenario)
        Opportunity opp = new Opportunity(
            Name = 'Test Opp Insert',
            StageName = 'Prospecting',
            AccountId = acc.Id
        );
        insert opp;

        // Opportunity for update path with null CloseDate
        Opportunity oppUpd = new Opportunity(
            Name = 'Test Opp Update',
            StageName = 'Prospecting',
            AccountId = acc.Id,
            CloseDate = null
        );
        insert oppUpd;
    }

    @IsTest
    static void testBeforeInsertSetsCloseDate() {
        // Create Opp with null CloseDate to trigger before insert defaulting
        Account a = [SELECT Id FROM Account LIMIT 1];
        Opportunity o = new Opportunity(
            Name = 'Insert Null CloseDate',
            StageName = 'Prospecting',
            AccountId = a.Id
        );
        Test.startTest();
        insert o;
        Test.stopTest();

        Opportunity inserted = [SELECT Id, CloseDate FROM Opportunity WHERE Id = :o.Id];
        System.assertNotEquals(null, inserted.CloseDate, 'CloseDate should be auto-set on insert when blank');

        // Validate end-of-month
        Date today = Date.today();
        Integer lastDay = Date.daysInMonth(today.year(), today.month());
        Date expectedEOM = Date.newInstance(today.year(), today.month(), lastDay);
        System.assertEquals(expectedEOM, inserted.CloseDate, 'CloseDate should be set to end of current month');
    }

    @IsTest
    static void testBeforeUpdateSetsCloseDate() {
        Opportunity o = [SELECT Id, CloseDate FROM Opportunity WHERE Name = 'Test Opp Update' LIMIT 1];
        System.assertEquals(null, o.CloseDate, 'Precondition: CloseDate is null');

        Test.startTest();
        // Touch a field to invoke before update; keep CloseDate null
        o.Name = 'Test Opp Update - Modified';
        update o;
        Test.stopTest();

        Opportunity updated = [SELECT Id, CloseDate FROM Opportunity WHERE Id = :o.Id];
        System.assertNotEquals(null, updated.CloseDate, 'CloseDate should be auto-set on update when blank');

        Date today = Date.today();
        Integer lastDay = Date.daysInMonth(today.year(), today.month());
        Date expectedEOM = Date.newInstance(today.year(), today.month(), lastDay);
        System.assertEquals(expectedEOM, updated.CloseDate, 'CloseDate should be set to end of current month on update');
    }

    @IsTest
    static void testNoChangeWhenCloseDateAlreadySet() {
        Account a = [SELECT Id FROM Account LIMIT 1];
        Date customDate = Date.today().addDays(10);
        Opportunity o = new Opportunity(
            Name = 'Pre-set CloseDate',
            StageName = 'Prospecting',
            AccountId = a.Id,
            CloseDate = customDate
        );
        Test.startTest();
        insert o;
        Test.stopTest();

        Opportunity inserted = [SELECT Id, CloseDate FROM Opportunity WHERE Id = :o.Id];
        System.assertEquals(customDate, inserted.CloseDate, 'Handler should not overwrite an already set CloseDate');
    }
}
