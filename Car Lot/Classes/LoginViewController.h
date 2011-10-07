#import <UIKit/UIKit.h>
#import "DefaultSecurityController.h"


@interface LoginViewController : UIViewController

@property (nonatomic, retain) IBOutlet DefaultSecurityController *securityController;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;
@property (nonatomic, retain) IBOutlet UIButton *logInButton;
@property (nonatomic, retain) IBOutlet UILabel *authenticationFailedLabel;

- (IBAction)logIn:(id)sender;

@end
