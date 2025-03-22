Public class StaticVariable {
   	Integer rollno;
	String name;
	Static String college = 'ITS';
	Public StaticVariable(Integer r, String n){
		rollno = r;
		name = n;
	}
	public void display (){
        System.debug(rollno+' '+name+' '+college);
	}
}