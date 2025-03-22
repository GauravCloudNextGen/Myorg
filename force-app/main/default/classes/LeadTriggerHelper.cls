public class LeadTriggerHelper {
	public Static void DuplicateEmail(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        List<Contact>contactEmail  = [SELECT Name,Email FROM Contact];
        for(Lead l : TriggerNew)
        {
           for(Contact c : contactEmail)
           {
               if(l.Email == c.Email)
                   {
                       l.addError('Email already Exists');
                   }
           }
        }
    }
}