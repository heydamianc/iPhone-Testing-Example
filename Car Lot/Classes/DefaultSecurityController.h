#import <Foundation/Foundation.h>
#import "Salesman.h"

@interface DefaultSecurityController : NSObject

- (BOOL)authenticateUserWithUsername:(NSString *)username password:(NSString *)password;
- (BOOL)authorizeSalesman:(Salesman *)salesman forSystem:(NSString *)system;

@end
