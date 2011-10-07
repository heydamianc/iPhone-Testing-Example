#import "Salesman.h"

@implementation Salesman
@synthesize employeeID  = _employeeID;
@synthesize firstName   = _firstName;
@synthesize lastName    = _lastName;
@synthesize credentials = _credentials;

- (void)dealloc {
    [_employeeID release];
    [_firstName release];
    [_lastName release];
    [_credentials release];
    [super dealloc];
}

@end
