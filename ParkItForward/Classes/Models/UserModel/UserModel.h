//
//  UserModel.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

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
@property (nonatomic, readonly) NSString * userId;
@property (nonatomic, readonly) BOOL isOwner;
@property (nonatomic, readonly) NSString * carSpot;
@property (nonatomic, readonly) NSString * level;
@property (nonatomic, readonly) NSString * carRegistration;
@property (nonatomic, readonly) NSString * carMake;
@property (nonatomic, readonly) NSString * carModel;
@property (nonatomic, readonly) NSString * carColor;
-(instancetype)initWithData:(id)data;
@end
