public class ControllerClass {
public List<Contact> getContacts(){
        List<Contact> result=[Select FirstName, LastName, Title, Email from Contact where Email!=NULL Order by Name Asc];
            return result;
    }

}