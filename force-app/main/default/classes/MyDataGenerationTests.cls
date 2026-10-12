@istest
public class MyDataGenerationTests {
   @testSetup
    static void MyDataGenerationTests1(){
        List<sObject> accounts = Test.loadData(Account.SobjectType,'otherAccountData');
    }
    @isTest
    static void testLoadOtherAccountsFromStaticResource(){
        List<Account> acc1 = [Select ID from Account];
		system.assert(acc1.size() == 15, 'expected 15 accounts');
    }
}