//
//  LBHomeViewModel.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeViewModel.h"
#import "AFHTTPTool.h"
#import "LBHomeActivitieModel.h"

@implementation LBHomeViewModel

- (void)loadFreshHotData:(void (^)(NSArray *data, NSError *error))completeBlock{
    
    [[AFHTTPTool sharedManager] homeFreshHotLoadDataWithSuccess:^(id response) {
        NSArray *data = response[@"data"];
        
        NSMutableArray *mArr = [NSMutableArray array];
        [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LBGoodsModel *model = [LBGoodsModel goodsWithDict:obj];
            [mArr addObject:model];
        }];
        self.freshDataArray = mArr;
        completeBlock(mArr,nil);
        
    } failure:^(NSError *error) {
        NSLog(@"请求hot数据失败");
    }];
   
}

- (void)loadActivityData:(void (^)(NSArray *data, NSError *error))completeBlock{
    
    [[AFHTTPTool sharedManager] homeActivityDataWithSuccess:^(id response) {
        
        NSDictionary *data = response[@"data"];
        
        NSArray *activities = data[@"activities"];
        
        NSMutableArray *mArr = [NSMutableArray array];
        [activities enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LBHomeActivitieModel *model = [LBHomeActivitieModel activityModelWithDict:obj];
            [mArr addObject:model];
        }];
        self.activityDataArray = mArr;
        completeBlock(mArr,nil);
        
    } failure:^(NSError *error) {
        NSLog(@"请求activity数据失败");
    }];
}

@end
