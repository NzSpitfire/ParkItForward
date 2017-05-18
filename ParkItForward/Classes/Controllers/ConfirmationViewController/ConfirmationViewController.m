//
//  ConfirmationViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "ConfirmationViewController.h"

@interface ConfirmationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *slotNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tillDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *tillTimeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *reminderControl;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@end

@implementation ConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)reminderChangedValue:(id)sender {
}
- (IBAction)confirmButtonAction:(id)sender {
}

@end
