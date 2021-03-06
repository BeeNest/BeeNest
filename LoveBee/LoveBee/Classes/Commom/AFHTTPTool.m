//
//  AFHTTPTool.m
//  上车吧
//
//  Created by vane on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AFHTTPTool.h"
#import "SVProgressHUD.h"


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
 
    [SVProgressHUD showWithStatus:@"正在加载"];
    
    [self GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        
        if (failure) {
            [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
            failure(error);
        }
        
    }];
    
}
-(void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
     [SVProgressHUD showWithStatus:@"正在加载"];
    
    [self POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
        if (success) {
            
            [SVProgressHUD dismiss];
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
            failure(error);
        }
        
    }];

}

#pragma mark -首页新鲜热卖请求数据
// 新鲜热卖
- (void)homeFreshHotLoadDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/firstSell.json.php";
    
    NSDictionary *param = @{@"call" : @(2)};
    
    [self postWithUrl:url params:param success:success failure:failure];
    
}

// 活动
- (void)homeActivityDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/focus.json.php";
    
    NSDictionary *param = @{@"call" : @(1)};
    
    [self postWithUrl:url params:param success:success failure:failure];
}

#pragma mark -超市数据请求

- (void)superDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/supermarket.json.php";
    
    NSDictionary *param = @{@"call":@"5"};
    [self postWithUrl:url params:param success:success failure:failure];
    
}


- (void)keyWordWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/search.json.php";
    
    NSDictionary *param = @{@"call" : @"6"};
    
    [self postWithUrl:url params:param success:success failure:failure];
}

- (void)searchDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/promotion.json.php";
    
    NSDictionary *param = @{@"call" : @"8"};
    
    [self postWithUrl:url params:param success:success failure:failure];
}

@end
