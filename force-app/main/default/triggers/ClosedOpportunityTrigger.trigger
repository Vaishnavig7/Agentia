trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> listToTask = new List<Task>();
    
    for(Opportunity opp: Trigger.New){
        if(opp.StageName == 'Closed Won'){
          Task t = new Task(); 
          t.WhatId = opp.Id;
          t.Subject = 'Follow Up Test Task';
          listToTask.add(t);
        }
    }
    insert listToTask;
    
}