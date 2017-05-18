//
//  BaseViewController.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController

-(void) showSpinner;
-(void) hideSpinner;
-(void) showSpinnerWithText:(NSString*)text;
@end
