public class HelloWord_UsingScheduleClass implements Schedulable{
	public void execute(schedulableContext ctx)
	{
		list<Account> acc=new list<Account>();
        acc = [SELECT Id,Hello__c FROM Account];
		MyHelloWorld.addHelloWord(acc);
	}
}