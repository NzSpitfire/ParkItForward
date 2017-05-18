//
//  BaseViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupNavigationBar];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark - UI
-(void) setupNavigationBar{
    
    UIImageView * logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foxsports_logo"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    logo.frame = CGRectMake(0, 0, 44, 44);
    self.navigationItem.titleView = logo;
    
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBarHidden = NO;
}
-(void) showSpinner{
   [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void) hideSpinner{
    MBProgressHUD * spinner = [MBProgressHUD HUDForView:self.view];
    [spinner hideAnimated:YES];
    
}
-(void) showSpinnerWithText:(NSString*)text{
}
@end
