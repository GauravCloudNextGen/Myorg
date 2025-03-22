trigger OppTeam on Opportunity (after insert) {
    List<OpportunityShare> sharesTocreate = new List<OpportunityShare>();
    List<OpportunityTeamMember> oppTeam = new List<OpportunityTeamMember>();
    OpportunityShare oshare = new OpportunityShare();
    oshare.OpportunityAccessLevel = 'Edit';
    oshare.OpportunityId = trigger.new[0].Id;
    oshare.UserOrGroupId = trigger.new[0].createdby.Id;
    sharesToCreate.add(oshare);
    OpportunityTeamMember ot = new OpportunityTeamMember();
    ot.OpportunityId = trigger.new[0].Id;
    ot.UserId = trigger.new[0].OwnerId;
    ot.TeamMemberRole = 'Account Manager';
    oppTeam.add(ot);
    if(oppTeam!=NULL && oppTeam.size()>0)
        {
            insert oppTeam;
        }
    if(sharesToCreate!=NULL && sharesToCreate.size()>0)
    {
        list<Database.SaveResult> sr = Database.insert(sharesToCreate,false);
    }
}