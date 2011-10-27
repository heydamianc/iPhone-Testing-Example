#import "DefaultSecurityController.h"


@interface DefaultSecurityControllerTests : SenTestCase

@property(nonatomic, retain) DefaultSecurityController *securityController;

@end


@implementation DefaultSecurityControllerTests
@synthesize securityController = _securityController;

- (void)setUp {
    self.securityController = [DefaultSecurityController new];
}

- (void)tearDown {
    self.securityController = nil;
}

- (void)testAuthenticateWithUsernamePassword_withValidCredentials {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:@"aUsername" password:@"aPassword"];
    STAssertTrue(authenticated, nil);
}

- (void)testAuthenticateWithUsernamePassword_withNilName {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:nil password:@"aPassword"];
    STAssertFalse(authenticated, nil);
}

- (void)testAuthenticateWithUsernamePassword_withEmptyName {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:@"" password:@"aPassword"];
    STAssertFalse(authenticated, nil);
}

- (void)testAuthenticateWithUsernamePassword_withNilPassword {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:@"aUsername" password:nil];
    STAssertFalse(authenticated, nil);
}

- (void)testAuthenticateWithUsernamePassword_withEmptyPassword {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:@"aUsername" password:@""];
    STAssertFalse(authenticated, nil);
}

- (void)testAuthorizeSalesmanForSystem_withCredentials {
    id salesman = [OCMockObject mockForClass:[User class]];
    [[[salesman stub] andReturn:[NSArray arrayWithObjects:@"payroll", @"ordering", nil]] credentials];
    
    DefaultSecurityController *securityController = [DefaultSecurityController new];
    BOOL authorized = [securityController authorizeUser:salesman forSystem:@"payroll"];
    
    STAssertTrue(authorized, nil);
}

- (void)testAuthorizeSalesmanForSystem_withoutCredentials {
    id salesman = [OCMockObject niceMockForClass:[User class]];
    [[[salesman stub] andReturn:[NSArray arrayWithObjects:@"ordering", nil]] credentials];
    
    DefaultSecurityController *securityController = [[DefaultSecurityController alloc] init];
    BOOL authorized = [securityController authorizeUser:salesman forSystem:@"payroll"];
    
    STAssertFalse(authorized, nil);
    
    [salesman verify];
}

- (void)testAuthorizeSalesmanForSystem_withNullSalesman {
    id user = nil;
    DefaultSecurityController *securityController = [[DefaultSecurityController alloc] init];
    BOOL authorized = [securityController authorizeUser:user forSystem:@"payroll"];
    
    STAssertFalse(authorized, nil);
}

@end
