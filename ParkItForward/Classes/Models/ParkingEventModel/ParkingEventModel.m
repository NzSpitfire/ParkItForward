//
//  ParkingEventModel.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "ParkingEventModel.h"

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
}
@end
