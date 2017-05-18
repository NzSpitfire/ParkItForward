//
//  LogInViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "LogInViewController.h"
#import "CalendarViewController.h"
#import "RegistrationViewController.h"
#import "TodayNavigationViewController.h"
#import "DataProvider.h"


@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUIElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupUIElements{
    self.loginButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.loginButton.layer.borderWidth = 1.0f;
    self.loginButton.backgroundColor = [UIColor blackColor];
}
#pragma mark - Button Actions

- (IBAction)loginButtonAction:(id)sender {
    
    if (self.loginTextField.text.length==0 ||
        self.passwordTextField.text.length == 0){
        [self showAlertEmptyFields];
        return;
    }
     [self showSpinner];
    [self performSelector:@selector(proceedUserAuthorization) withObject:nil afterDelay:5];
 
    
  //  TodayNavigationViewController * registerVC = [[TodayNavigationViewController alloc] init];
  //  [self.navigationController pushViewController:registerVC animated:YES];
    
}
- (IBAction)registerButtonAction:(id)sender {
    RegistrationViewController * registerVC = [[RegistrationViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
-(void)proceedUserAuthorization{
   // [self showSpinner];
    __weak typeof(self) weakSelf = self;
    [[DataProvider sharedInstance] getUsers:^(NSArray *users){
        [weakSelf hideSpinner];
        TodayNavigationViewController * registerVC = [[TodayNavigationViewController alloc] init];
        [weakSelf.navigationController pushViewController:registerVC animated:YES];

    }failure:^(NSError * error){
        [weakSelf hideSpinner];
    }];
}
-(void) showAlertEmptyFields{
    NSString * alertMessage = @"Email or password cannot be empty";
    NSString * alertTitle = @"Error";
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:alertTitle
                                          message:alertMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action){
                                                          weakSelf.loginTextField.text = @"";
                                                          weakSelf.passwordTextField.text = @"";
                                                          [weakSelf.loginTextField becomeFirstResponder];
                                                          
                                                      }];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
