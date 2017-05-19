//
//  UserProvider.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 19/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "UserProvider.h"

@interface UserProvider ()
@property (nonatomic, strong) UserModel * currentUser;
@end

@implementation UserProvider

+ (instancetype)sharedInstance {
    static UserProvider *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}
- (id)init {
    self = [super init];
    
    return self;
}
-(UserModel*) getUser{
    return self.currentUser;
}
-(void)storeCurrentUser:(UserModel*)userModel{
    self.currentUser = userModel;
}
-(void)resetCurrentUser{
    self.currentUser = nil;
}
@end
