trigger AccountTrigger on Account (before insert) {
	for(Account a:Trigger.new)
    {
        a.Description='New Description is added from Triggers';
		a.Website='mohit123@gmail.com';
    }
}