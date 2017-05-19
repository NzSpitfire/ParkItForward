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
#import "ColorHelper.h"
#import "DataProvider.h"
#import "MBProgressHUD.h"
#import "UserModel.h"
#import "UserProvider.h"
#import "AppDelegate.h"

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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupUIElements{
    self.loginButton.backgroundColor = [ColorHelper getTopGradientColor];
    self.loginButton.layer.cornerRadius = 5.0f;
    
    
    self.registerButton.backgroundColor = [ColorHelper getTopGradientColor];
    self.registerButton.layer.cornerRadius = 5.0f;
}
#pragma mark - Button Actions

- (IBAction)loginButtonAction:(id)sender {
    
    if (self.loginTextField.text.length==0){
        [self showWrongCredentialsAlert];
        return;
    }
    [self getAllUsers];
    
}
- (IBAction)registerButtonAction:(id)sender {
    RegistrationViewController * registerVC = [[RegistrationViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
-(void)getAllUsers{
    
    
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    DataProvider * provider = [DataProvider sharedInstance];
    __weak typeof(self) weakSelf = self;
    [provider getUsers:^(NSArray * array){
        [weakSelf checkUser:array];
        [weakSelf hideSpinner];
    }failure:^(NSError * error){
        [self hideSpinner];
        [weakSelf showNetworkIssueAlert];
    }];
}
-(void)checkUser:(NSArray*)array{
    
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    UserModel * model = nil;
    NSString * currentLogin = self.loginTextField.text;
    NSInteger count = [array count];
    for (NSInteger index=0; index<count; index++){
        UserModel * currentModel = array[index];
        if (currentModel.userId == currentLogin){
            model = currentModel;
            break;
        }
    }
    if (model){
        UserProvider * provider= [UserProvider sharedInstance];
        [provider storeCurrentUser:model];
    }
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [delegate presentTodayController];
    
}
-(void) hideSpinner{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}
-(void)showNetworkIssueAlert{
    NSString * message = @"We have experienced with some issues. Try later.";
    [self showNetworkIssueAlertWithTitle:@"Error" message:message];
}
-(void)showWrongCredentialsAlert{
    NSString * message = @"Please enter your email";
    [self showNetworkIssueAlertWithTitle:@"Error" message:message];
}
-(void)showNetworkIssueAlertWithTitle:(NSString*)title
                              message:(NSString*)message{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                        style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOk];
    __weak typeof(self) weakSelf = self;
    [self presentViewController:alert animated:YES completion:^{
        weakSelf.loginTextField.text = @"";;
        weakSelf.passwordTextField.text = @"";
    }];
}
@end
