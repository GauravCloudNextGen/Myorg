public class PositionTriggerHelper {
	public static void FillValues(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
        for(Position__c p : TriggerNew)
            {
                if(p.Status__c == 'New Position')
                {
                    if(p.Open_Date__c == null)
                    {
                        p.Open_Date__c = System.Today();
                    }
                	if(p.Min_Pay__c == null)
                    {
                        p.Min_Pay__c = 10000;
                    }
                	if(p.Max_Pay__c == null)
                    {
                        p.Max_Pay__c = 15000;
                    }
                }
            }
    }
}