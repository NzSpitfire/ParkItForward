//
//  CalendarViewController.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayViewController.h"

@interface CalendarViewController : UIViewController

-(instancetype)initWithDelegate:(id<TodayViewControllerDelegate>)delegate;

@end
