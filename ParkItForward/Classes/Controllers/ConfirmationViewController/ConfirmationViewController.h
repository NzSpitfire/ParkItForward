//
//  ConfirmationViewController.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingEventModel.h"

@interface ConfirmationViewController : UIViewController

-(instancetype)initWithParkingEvent:(ParkingEventModel*)event;
@end
