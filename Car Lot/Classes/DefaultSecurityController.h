#import <Foundation/Foundation.h>
#import "User.h"

@interface DefaultSecurityController : NSObject

- (BOOL)authenticateUserWithUsername:(NSString *)username password:(NSString *)password;
- (BOOL)authorizeUser:(User *)salesman forSystem:(NSString *)system;

@end
