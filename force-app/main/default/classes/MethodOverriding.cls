public virtual class MethodOverriding {
   public virtual void run(){
		System.debug('running');
 	}
    public class Splender Extends MethodOverriding{
		public override void run(){
			System.debug('running safely with 60km');
 		}
	}
}