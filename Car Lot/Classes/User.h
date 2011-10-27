#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, retain) NSNumber *employeeID;
@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSArray  *credentials;

@end
