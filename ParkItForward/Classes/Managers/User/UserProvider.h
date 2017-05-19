//
//  UserProvider.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 19/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserProvider : NSObject

@property (nonatomic, readonly) UserModel * currentUser;

+ (id)sharedInstance;
-(UserModel*) currentUser;
-(void)storeCurrentUser:(UserModel*)userModel;
-(void)resetCurrentUser;

@end
