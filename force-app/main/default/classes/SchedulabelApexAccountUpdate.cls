public class SchedulabelApexAccountUpdate implements Schedulable{
	public void execute(schedulableContext ctx)
    {
		BatchAccountUpdate bau=new BatchAccountUpdate();
		Database.executeBatch(bau);
	}
}