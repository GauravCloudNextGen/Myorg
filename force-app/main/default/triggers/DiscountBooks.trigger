trigger DiscountBooks on Book__c (before insert, before update) {
	for(Book__c b : trigger.new)
    {
        b.Price__c = b.Price__c*0.9;
    }
}