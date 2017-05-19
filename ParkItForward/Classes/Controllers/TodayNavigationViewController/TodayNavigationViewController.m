//
//  TodayViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "TodayNavigationViewController.h"
#import "TodayViewController.h"
#import "Masonry-umbrella.h"
#import "ConfirmationViewController.h"
#import "CalendarViewController.h"
#import "SpotViewController.h"

@interface TodayNavigationViewController () <TodayViewControllerDelegate, SpotViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) TodayViewController * todayVC;
@property (strong, nonatomic) SpotViewController * spotVC;



@end

@implementation TodayNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self segmentValueChanged:nil];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentValueChanged:(id)sender {
    
    [self removeCurrentContent];
    if (self.segmentControl.selectedSegmentIndex == 0){
        self.contentView.backgroundColor = [UIColor redColor];
        self.todayVC = [[TodayViewController alloc] initWithDelegate:self];
        [self addChildViewController:self.todayVC];
        [self.contentView addSubview:self.todayVC.view];
        [self.todayVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }else {
        self.contentView.backgroundColor = [UIColor redColor];
        self.spotVC = [[SpotViewController alloc] initWithDelegate:self];
        [self addChildViewController:self.spotVC];
        [self.contentView addSubview:self.spotVC.view];
        [self.spotVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
}
-(void) removeCurrentContent{
    
    for (UIView * currentView in self.contentView.subviews){
        [currentView removeFromSuperview];
        [self.todayVC removeFromParentViewController];
        [self.spotVC removeFromParentViewController];
    }
}
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)presentCalendar{
    CalendarViewController  * controller = [[CalendarViewController alloc] initWithDelegate:self];
    [self.navigationController pushViewController:controller  animated:YES];
}
-(void)presentConfirmationScreen:(ParkingEventModel*)model{
    
    ConfirmationViewController * controller = [[ConfirmationViewController alloc] initWithParkingEvent:model];
    [self.navigationController pushViewController:controller  animated:YES];
    
}
@end
