@IsTest
public class PermissionsTests {

    @IsTest
    static void testPositivePermissionSet() {

        // Create User 1 (owner)
        User ownerUser = new User(
            Alias = 'owner',
            Email = 'owner@test.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Owner',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = UserInfo.getProfileId(),
            TimeZoneSidKey = 'Asia/Kolkata',
            Username = 'owner' + System.currentTimeMillis() + '@test.com'
        );
        insert ownerUser;

        // Create User 2 (non-owner)
        User testUser = new User(
            Alias = 'viewer',
            Email = 'viewer@test.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Viewer',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = UserInfo.getProfileId(),
            TimeZoneSidKey = 'Asia/Kolkata',
            Username = 'viewer' + System.currentTimeMillis() + '@test.com'
        );
        insert testUser;

        // Create record owned by User 1
        Private_Object__c po = new Private_Object__c(
            Name = 'Private Record',
            OwnerId = ownerUser.Id
        );
        insert po;

        // Assign permission set
        PermissionSet ps = [
            SELECT Id
            FROM PermissionSet
            WHERE Name = 'Private_Object_Access'
        ];

        insert new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = ps.Id
        );

        // Verify access as User 2
        System.runAs(testUser) {
            Test.startTest();
            Private_Object__c result = [
                SELECT Id
                FROM Private_Object__c
                WHERE Id = :po.Id
            ];
            Test.stopTest();

            System.assertNotEquals(
                null,
                result,
                'User with permission set should access record'
            );
        }
    }
}