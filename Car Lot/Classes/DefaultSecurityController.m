#import "DefaultSecurityController.h"
#import "User.h"

@implementation DefaultSecurityController

- (BOOL)authenticateUserWithUsername:(NSString *)username password:(NSString *)password {
    BOOL authenticated = YES;
    
    authenticated &= username != nil;
    authenticated &= ![username isEqualToString:@""];
    authenticated &= password != nil;
    authenticated &= ![password isEqualToString:@""];
    
    return authenticated;
}

- (BOOL)authorizeUser:(User *)salesman forSystem:(NSString *)system {
    return [salesman.credentials containsObject:system];
}

@end
