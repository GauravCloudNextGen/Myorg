public class ParameterizedConstructor {
	Integer id;
	String name;
	Public ParameterizedConstructor(Integer i, String n){
		id = i;
		name = n;
	}
	Public void display(){
		System.debug(id+' '+name);
	}
}