public class ContactAndLeadSearch {
public static List<List<SObject>> searchContactsAndLeads(String searchparam)
    {
        List<List<SObject>> serachlist = [FIND :searchparam IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        Contact[] serchContcts = (Contact[])serachlist[0];
        Lead[] searchLead = (Lead[])serachlist[1];
        return serachlist;
    }
}