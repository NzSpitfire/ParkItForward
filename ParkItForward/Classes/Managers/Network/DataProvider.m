//
//  DataFetcher.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "DataProvider.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const kGetAllUsersPath = @"https://9ifsk0e0j5.execute-api.ap-southeast-2.amazonaws.com/Testing/users";

@implementation DataProvider

+ (id)sharedInstance {
    static DataProvider *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    
    return self;
}

+ (void)getUsers:(void (^)(NSArray *categories))successBlock
         failure:(void (^)(NSError* error))failureBlock{
    
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    [sessionManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [sessionManager.requestSerializer setTimeoutInterval:30];
    [sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    NSString * baseUrl = kGetAllUsersPath;
    NSURL * URL = [NSURL URLWithString:baseUrl];
    [sessionManager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock){
            successBlock (responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock){
            failureBlock(error);
        }
    }];

}

@end
