//
//  ParkingEventModel.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "ParkingEventModel.h"

/*
 {
 id: "Rob.Oliver@foxsports.com.au",
 timeStart: "1495152000",
 timeEnd: "1495238399",
 carSpot: "B1 21",
 isFree: false
 },
 */

static NSString * const kIdKey = @"id";
static NSString * const kTimeStartKey = @"timeStart";
static NSString * const kTimeEndKey = @"timeEnd";
static NSString * const kCarSportKey = @"carSpot";
static NSString * const kIsFreeKey = @"isFree";

@interface ParkingEventModel ()

@property (nonatomic, strong) NSString * userId;
@property (nonatomic, assign) NSTimeInterval timeStart;
@property (nonatomic, assign) NSTimeInterval timeEnd;
@property (nonatomic, strong) NSString * carSpot;
@property (nonatomic, assign) BOOL isFree;

@end

@implementation ParkingEventModel


-(instancetype)initWithData:(id)data{
    self = [super init];
    if (self){
        if ([data isKindOfClass:[NSDictionary class]]){
            [self parseDict:data];
        }
    }
    return self;
}
-(void)parseDict:(NSDictionary*)dict{
    [self parseUserId:dict];
    [self parseTimeStart:dict];
    [self parseTimeEnd:dict];
    [self parseCarSpot:dict];
    [self parseIsFree:dict];
}
-(void)parseUserId:(NSDictionary*)dict{
    if (dict[kIdKey]){
        self.userId = dict[kIdKey];
    }
}
-(void)parseTimeStart:(NSDictionary*)dict{
    if (dict[kTimeStartKey]){
        self.timeStart = [dict[kTimeStartKey] doubleValue];
    }
}
-(void)parseTimeEnd:(NSDictionary*)dict{
    if (dict[kTimeEndKey]){
        self.timeEnd = [dict[kTimeEndKey] doubleValue];
    }
}
-(void)parseCarSpot:(NSDictionary*)dict{
    if (dict[kCarSportKey]){
        self.carSpot = dict[kCarSportKey];
    }
}
-(void)parseIsFree:(NSDictionary*)dict{
    if (dict[kIsFreeKey]){
        self.isFree = [dict[kIsFreeKey] boolValue];
    }
}
@end
