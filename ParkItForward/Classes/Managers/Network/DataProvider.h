//
//  DataFetcher.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface DataProvider : NSObject

+ (id)sharedInstance;
- (void)getUsers:(void (^)(NSArray *categories))successBlock
        failure:(void (^)(NSError* error))failureBlock;
- (void)getUser:(void (^)(UserModel *user))successBlock
         failure:(void (^)(NSError* error))failureBlock
         user:(NSString*)userString;

@end
