//
//  LBHomeViewModel.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeViewModel.h"
#import "AFHTTPTool.h"

@implementation LBHomeViewModel

- (void)loadFreshHotDataWithSuccess:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure{
    
    [[AFHTTPTool sharedManager] homeFreshHotLoadDataWithSuccess:success failure:failure];
}

@end
