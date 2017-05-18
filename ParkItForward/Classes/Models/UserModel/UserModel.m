//
//  UserModel.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "UserModel.h"

/*
 id: "Robert.Oliver@foxsports.com.au",
 isOwner: true,
 carSpot: "21",
 level: "B1",
 carRegistration: "",
 carModel: "",
 carMake: "",
 color: ""
 */

static NSString * const kIdKey              = @"id";
static NSString * const kIsOwnerKey         = @"isOwner";
static NSString * const kCarSpotKey         = @"carSpot";
static NSString * const kLevelKey           = @"level";
static NSString * const kCarRegistrationKey = @"carRegistration";
static NSString * const kCarModelKey        = @"carModel";
static NSString * const kCarMakeKey         = @"carMake";
static NSString * const kCarColorKey        = @"color";


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
    [self parseUserId:dict];
    [self parseOwner:dict];
    [self parseCarSpot:dict];
    [self parseLevel:dict];
    [self parsecarRegistration:dict];
    [self parseCarMake:dict];
    [self parseCarModel:dict];
    [self parseCarColor:dict];
}
-(void)parseUserId:(NSDictionary*)dict{
    if (dict[kIdKey]){
        self.userId = dict[kIdKey];
    }
}
-(void)parseOwner:(NSDictionary*)dict{
    if (dict[kIsOwnerKey]){
        self.isOwner = [dict[kIsOwnerKey] boolValue];
    }
}
-(void)parseCarSpot:(NSDictionary*)dict{
    if (dict[kCarSpotKey]){
        self.carSpot = dict[kCarSpotKey];
    }
}
-(void)parseLevel:(NSDictionary*)dict{
    if (dict[kLevelKey]){
        self.level = dict[kLevelKey];
    }
}
-(void)parsecarRegistration:(NSDictionary*)dict{
    if (dict[kCarRegistrationKey]){
        self.carRegistration = dict[kCarRegistrationKey];
    }
}
-(void)parseCarMake:(NSDictionary*)dict{
    if (dict[kCarMakeKey]){
        self.carMake = dict[kCarMakeKey];
    }
}
-(void)parseCarModel:(NSDictionary*)dict{
    if (dict[kCarModelKey]){
        self.carModel = dict[kCarModelKey];
    }
}
-(void)parseCarColor:(NSDictionary*)dict{
    if (dict[kCarColorKey]){
        self.carColor = dict[kCarColorKey];
    }
}
@end
