//
//  TodayCell.h
//  ParkItForward
//
//  Created by Brad Clark on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblParkNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblFromDate;
@property (weak, nonatomic) IBOutlet UILabel *lblToDate;


@end
