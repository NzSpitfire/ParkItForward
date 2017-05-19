//
//  BaseViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 19/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "BaseViewController.h"
#import "ColorHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    UIImage * image = [UIImage imageNamed:@"foxsports_logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.navigationController.navigationBar.barTintColor = [ColorHelper getTopGradientColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar.topItem setTitleView:imageView];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setNeedsStatusBarAppearanceUpdate];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(BOOL) prefersStatusBarHidden
{
    return NO;
}
@end
