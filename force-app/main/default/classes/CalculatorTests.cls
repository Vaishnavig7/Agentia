@IsTest
public class CalculatorTests {

    // ✅ Negative test (divide by zero)
    @IsTest
    static void testDivideByZero() {
        Test.startTest();
        try {
            Calculator.divide(10, 0);
            System.assert(false, 'Exception should be thrown');
        } catch (Exception e) {
            System.assert(e.getMessage() != null);
        }
        Test.stopTest();
    }

    // ✅ Positive test (normal division)
    @IsTest
    static void testDivideSuccess() {
        Test.startTest();
        Decimal result = Calculator.divide(10, 2);
        Test.stopTest();

        System.assertEquals(5, result, '10 divided by 2 should be 5');
    }
}