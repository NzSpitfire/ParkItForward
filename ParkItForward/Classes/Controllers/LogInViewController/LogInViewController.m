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
    self.loginButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.loginButton.layer.borderWidth = 1.0f;
    self.loginButton.layer.cornerRadius = 5.0f;
    
    self.registerButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.registerButton.layer.borderWidth = 1.0f;
    self.registerButton.layer.cornerRadius = 5.0f;
}
#pragma mark - Button Actions

- (IBAction)loginButtonAction:(id)sender {
    TodayNavigationViewController * registerVC = [[TodayNavigationViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
- (IBAction)registerButtonAction:(id)sender {
    RegistrationViewController * registerVC = [[RegistrationViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
