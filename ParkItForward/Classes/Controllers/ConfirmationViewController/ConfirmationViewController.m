//
//  ConfirmationViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "ConfirmationViewController.h"
#import "ColorHelper.h"

@interface ConfirmationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fromDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tillDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *tillTimeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *reminderControl;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *carSlot;

@property (nonatomic, strong) ParkingEventModel * eventModel;
@end

@implementation ConfirmationViewController

-(instancetype)initWithParkingEvent:(ParkingEventModel*)event{
    self = [super init];
    if (self){
        self.eventModel = event;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self updateConfirmButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateViews{
    self.carSlot.text = self.eventModel.carSpot;
    
    self.fromDateLabel.text = [self getDate:self.eventModel.timeStart];
    self.fromTimeLabel.text = [self getTime:self.eventModel.timeStart];
    
    self.tillDateLabel.text = [self getDate:self.eventModel.timeEnd];
    self.tillTimeLabel.text = [self getTime:self.eventModel.timeEnd];
}
- (IBAction)reminderChangedValue:(id)sender {
}
- (IBAction)confirmButtonAction:(id)sender {
}
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSString*) getDate:(NSTimeInterval)interval{
    NSString * resValue = nil;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM, YYYY"];
    resValue = [dateFormatter stringFromDate:date];
    return resValue;

    return resValue;
}
-(NSString*)getTime:(NSTimeInterval)interval{
    NSString * resValue = nil;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    resValue = [dateFormatter stringFromDate:date];
    return resValue;
}

-(void)updateConfirmButton{
    self.confirmButton.backgroundColor = [ColorHelper getTopGradientColor];
    self.confirmButton.layer.cornerRadius = 5.0f;
}
@end
