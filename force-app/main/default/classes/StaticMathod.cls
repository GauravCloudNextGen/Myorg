Public class StaticMathod {
	Integer rollno;
	String name;
	static String college ='ITS';
	Public static void change(){
		college = 'BBDIT';
	}
	Public StaticMathod(Integer r, String n){
		rollno = r;
		name = n;
	}
	Public void display (){
		System.debug(rollno+' '+name+' '+college);
	}
}