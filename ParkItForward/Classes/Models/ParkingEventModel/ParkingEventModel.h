//
//  ParkingEventModel.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParkingEventModel : NSObject
/*
 id: 'ally.beaton@foxsports.com.au',
 timeStart: '1495065600',
 timeEnd: '1495151999',
 carSpot: 'B1 21',
 isFree: true
 */
@property (nonatomic, readonly) NSString * userId;
@property (nonatomic, readonly) NSTimeInterval timeStart;
@property (nonatomic, readonly) NSTimeInterval timeEnd;
@property (nonatomic, readonly) NSString * carSpot;
@property (nonatomic, readonly) BOOL isFree;

-(instancetype)initWithData:(id)data;
@end
