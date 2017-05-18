//
//  UserModel.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "UserModel.h"

@interface UserModel ()
@property (nonatomic, strong) NSString * userId;
@property (nonatomic, assign) BOOL isOwner;
@property (nonatomic, strong) NSString * carSpot;
@property (nonatomic, strong) NSString * level;
@property (nonatomic, strong) NSString * carRegistration;
@property (nonatomic, strong) NSString * carMake;
@property (nonatomic, strong) NSString * carModel;
@property (nonatomic, strong) NSString * carColor;
@end

@implementation UserModel

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
