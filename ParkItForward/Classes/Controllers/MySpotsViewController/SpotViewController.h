//
//  TodayViewController.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingEventModel.h"

@protocol  SpotViewControllerDelegate <NSObject>

-(void)presentConfirmationScreen:(ParkingEventModel*)model;
-(void)presentCalendar;

@end

@interface SpotViewController : UIViewController
-(instancetype)initWithDelegate:(id<SpotViewControllerDelegate>)delegate;

@end
