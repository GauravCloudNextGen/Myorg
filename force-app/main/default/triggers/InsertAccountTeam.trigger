trigger InsertAccountTeam on Customer__c (after insert) {
	List<AccountTeamMember>atm_list = new List<AccountTeamMember>();
    AccountTeamMember atm = new AccountTeamMember();
    List<AccountShare> newShare = new List<AccountShare>();
    for(Customer__c c : Trigger.New)
    {
        if(c.Account_Manager__c!=null)
            {
                atm = new AccountTeamMember();
                atm.AccountId = c.Account__c;
                atm.TeamMemberRole = 'Account Manager';
                atm.UserId = c.Account_Manager__c;
                AccountShare shares = new AccountShare();
                shares.AccountId = c.Account__c;
                shares.UserOrGroupId = c.Account_Manager__c;
                shares.AccountAccessLevel = 'Read/Write';
                shares.OpportunityAccessLevel = 'Read Only';
                shares.CaseAccessLevel  = 'Read Only';
                newShare.add(shares);
                atm_list.add(atm);
            }
    }
    if(atm_list!=null)
        {
            insert atm_list;
        }
    if(newShare!=null && newShare.size()>0)
        {
            List<Database.saveresult> sr = Database.insert(newShare,false);
        }
}