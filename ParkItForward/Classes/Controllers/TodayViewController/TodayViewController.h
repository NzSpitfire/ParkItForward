//
//  TodayViewController.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingEventModel.h"

@protocol  TodayViewControllerDelegate <NSObject>

-(void)presentConfirmationScreen:(ParkingEventModel*)model;
-(void)presentCalendar;

@end

@interface TodayViewController : UIViewController
-(instancetype)initWithDelegate:(id<TodayViewControllerDelegate>)delegate;

@end
