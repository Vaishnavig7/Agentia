public class AccountUtility {
public static void viewAnnualRevenue() {
    List<Account> accountsList = [SELECT Name,AnnualRevenue FROM Account]; 
    for (Account act : accountsList)
    {
        System.debug(act.Name +':'+ act.AnnualRevenue);
	}
  }
}