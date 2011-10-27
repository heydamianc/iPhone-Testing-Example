#import "SecurityProxy.h"

@interface SecurityProxy ()

@property(nonatomic, retain) UIViewController *viewController;

@end

@implementation SecurityProxy
@synthesize viewController = _viewController;

- (id)initWithViewController:(UIViewController *)viewController {
    self.viewController = viewController;
    return self;
}

- (void)dealloc {
    [_viewController release];
    [super dealloc];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.viewController];
}

- (BOOL)respondsToSelector:(SEL)selector {
    return [self.viewController respondsToSelector:selector];
}

@end
