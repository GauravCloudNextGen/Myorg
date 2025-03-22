public class GlobalUtility {
	public static set<Id> getUniqueIds(list<SObject> sobs){
	set<Id> Ids = new set<Id>();
 		for (SObject sob : sobs){
 			Ids.add(sob.Id);
 		}		
 		return Ids;
	}
}