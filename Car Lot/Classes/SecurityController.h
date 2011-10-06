#import <Foundation/Foundation.h>

@protocol SecurityController <NSObject>

- (BOOL)authenticateUserWithUsername:(NSString *)username password:(NSString *)password;

@end
