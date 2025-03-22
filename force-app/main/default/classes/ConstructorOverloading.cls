public class ConstructorOverloading {
	Integer id;
	String name;
	Integer age;
	Public ConstructorOverloading (Integer i, String n){
		id = i;
		name = n;
	}
	Public ConstructorOverloading(Integer i, String n, Integer a){
		id = i;
		name = n;
		age=a;
	}
	public void display(){
		System.debug(id+' '+name+' '+age);
	}
}