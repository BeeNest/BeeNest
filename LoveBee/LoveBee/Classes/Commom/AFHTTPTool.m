//
//  AFHTTPTool.m
//  上车吧
//
//  Created by vane on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AFHTTPTool.h"


@implementation AFHTTPTool

+(instancetype)sharedManager{
    
    static AFHTTPTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc]initWithBaseURL:nil];
        
        instance.requestSerializer = [AFJSONRequestSerializer new];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        
    });
    return instance;
}
-(void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
 
    [self GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
        
    }];
    
}
-(void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    [self POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
        
    }];

}
@end