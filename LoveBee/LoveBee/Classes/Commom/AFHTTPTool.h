//
//  AFHTTPTool.h
//  上车吧
//
//  Created by vane on 16/7/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPTool : AFHTTPSessionManager

+(instancetype)sharedManager;

/**
 *  get形式请求网络数据
 *
 *  @param url     url地址
 *  @param params  参数
 *  @param success 请求成功之后的回调
 *  @param failure 请求失败之后的回调
 */
- (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


/**
 *  post形式请求网络数据
 *
 *  @param url     url地址
 *  @param params  参数
 *  @param success 请求成功之后的回调
 *  @param failure 请求失败之后的回调
 */
- (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


#pragma mark -首页请求数据接口方法
- (void)homeFreshHotLoadDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

- (void)homeActivityDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
#pragma mark -超市数据请求
- (void)superDataWithSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
@end
