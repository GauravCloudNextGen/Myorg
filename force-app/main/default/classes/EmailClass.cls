global class EmailClass {
	WebService static void SendEmailNotification()
	{
		Messaging.SingleEmailMessage mail =new Messaging.SingleEmailMessage();
		mail.setToAddresses (new string[ ] {'gauravmsplc008@gmail.com'});
		mail.setSenderDisplayName('Salesforce Email');
		mail.setSubject ('New Reminder');
		mail.setHtmlBody('Password');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[ ]{mail});
        System.debug('hello2');
	}	
}