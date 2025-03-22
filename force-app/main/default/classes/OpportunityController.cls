public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities() {
        return [SELECT Id, Name, StageName, Amount FROM Opportunity LIMIT 50];
    }
}