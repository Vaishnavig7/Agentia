@isTest
public class TestClass15 {
@isTest
    public static void add(){
        Decimal res1=sample15.add(5,5);
        System.assertEquals(10, res1);
    }
@isTest
    public static void sub(){
        Decimal res=sample15.sub(5,5);
        System.assertEquals(0, res);
    }
@isTest
    public static void mul(){
        Decimal res=sample15.mul(5,5);
        System.assertEquals(25, res);
    }
}