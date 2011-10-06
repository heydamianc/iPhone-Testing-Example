#import "LoginViewController.h"
#import "CarsViewController.h"

@interface LoginViewController ()

- (void)hideAuthenticationFailedLabel;

@end

@implementation LoginViewController

@synthesize securityController        = _securityController;
@synthesize usernameTextField         = _usernameTextField;
@synthesize passwordTextField         = _passwordTextField;
@synthesize logInButton               = _logInButton;
@synthesize authenticationFailedLabel = _authenticationFailedLabel;


#pragma mark -
#pragma mark LoginViewController

- (void)dealloc {
    [_securityController release];
    [_usernameTextField release];
    [_passwordTextField release];
    [_logInButton release];
    [_authenticationFailedLabel release];
    [super dealloc];
}

- (IBAction)logIn:(id)sender {
    BOOL authenticated = [self.securityController authenticateUserWithUsername:self.usernameTextField.text 
                                                                      password:self.passwordTextField.text];
    
    if (authenticated) {
        CarsViewController *carsViewController = [[CarsViewController alloc] initWithNibName:@"CarsView" bundle:nil];
        [self.navigationController pushViewController:carsViewController animated:YES];
        [carsViewController release];
    } else {
        self.authenticationFailedLabel.hidden = NO;
        [self performSelector:@selector(hideAuthenticationFailedLabel) withObject:self afterDelay:3.0f];
    }
}

- (void)hideAuthenticationFailedLabel {
    [UIView animateWithDuration:0.5f animations:^{
        self.authenticationFailedLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.authenticationFailedLabel.hidden = YES;
        self.authenticationFailedLabel.alpha = 1.0f;        
    }];
}


#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Log In";
}

- (void)viewDidUnload {
    self.usernameTextField = nil;
    self.passwordTextField = nil;
    self.logInButton = nil;
    self.authenticationFailedLabel = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

@end
