//
//  DataFetcher.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "DataProvider.h"
#import <AFNetworking/AFNetworking.h>
#import "UserModel.h"

static NSString * const kGetAllUsersPath = @"https://demo0788157.mockable.io/users";

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

- (void)getUsers:(void (^)(NSArray *categories))successBlock
         failure:(void (^)(NSError* error))failureBlock{
    
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    [sessionManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [sessionManager.requestSerializer setTimeoutInterval:30];
    [sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    NSString * baseUrl = kGetAllUsersPath;
    NSURL * URL = [NSURL URLWithString:baseUrl];
    __weak typeof(self) weakSelf = self;
    [sessionManager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * array = [weakSelf parseAllUsers:responseObject];
        if (successBlock){
            successBlock (array);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock){
            failureBlock(error);
        }
    }];

}


- (void)getUser:(void (^)(UserModel *user))successBlock
         failure:(void (^)(NSError* error))failureBlock
         user:(NSString *)userString{
    
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    [sessionManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [sessionManager.requestSerializer setTimeoutInterval:30];
    [sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    
    NSString * baseUrl = [[kGetAllUsersPath stringByAppendingString:@"/"] stringByAppendingString:userString];;
    NSURL * URL = [NSURL URLWithString:baseUrl];
    __weak typeof(self) weakSelf = self;
    [sessionManager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * array = [weakSelf parseAllUsers:responseObject];
        if (successBlock){
            successBlock (array[0]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock){
            failureBlock(error);
        }
    }];
    
}

-(NSArray*)parseAllUsers:(id)response{
    NSArray * resValue = nil;
    if (![response isKindOfClass:[NSArray class]]){
        return resValue;
    }
    
    NSMutableArray * tempArray = [NSMutableArray array];
    NSArray * initialArray= (NSArray*)response;
    NSInteger count = [initialArray count];
    for (NSInteger index=0; index< count; index++){
        id currentObject = initialArray[index];
        UserModel * currentModel = [[UserModel alloc] initWithData:currentObject];
        if (currentObject){
            [tempArray addObject:currentModel];
        }
    }
    if ([tempArray count]>0){
        resValue = [NSArray arrayWithArray:tempArray];
    }
    return resValue;
}



@end
