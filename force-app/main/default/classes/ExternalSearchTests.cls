@IsTest
private class ExternalSearchTests {

    // Mock factory that can return any status code
    private class HTTPMockFactory implements HttpCalloutMock {
        private Integer statusCode;

        HTTPMockFactory(Integer statusCode) {
            this.statusCode = statusCode;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(statusCode);
            res.setBody('I found it!');
            return res;
        }
    }

    // Positive test (200 response)
    @IsTest
    static void testPositiveMocking() {
        Test.setMock(HttpCalloutMock.class, new HTTPMockFactory(200));

        Test.startTest();
        String result = ExternalSearch.googleIt('epic search');
        Test.stopTest();

        System.assertEquals('I found it!', result);
    }

    
    // Negative test (500 response) with try–catch and googleIt call
    @IsTest
    static void testNegativeMocking() {

        Test.setMock(HttpCalloutMock.class, new HTTPMockFactory(500));

        Test.startTest();
        try {
            ExternalSearch.googleIt('epic search');

            // Fail test if no exception
            System.assert(false, 'Exception should have been thrown');
        } catch (Exception e) {
            // Assertion INSIDE catch (Trailhead requirement)
            System.assertEquals(
                'Did not recieve a 200 status code: 500',
                e.getMessage()
            );
        }
        Test.stopTest();
    }
}