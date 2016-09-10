//
//  LBHomeViewModel.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBGoodsModel.h"
#import "LBHomeActivitieModel.h"

@interface LBHomeViewModel : NSObject

@property (nonatomic, strong) NSArray<LBGoodsModel *> *freshDataArray;

@property (nonatomic, strong) NSArray<LBHomeActivitieModel *> *activityDataArray;


#pragma mark - 请求数据方法
// 新鲜热卖
- (void)loadFreshHotData:(void (^)(NSArray *data, NSError *error))completeBlock;

// 活动
- (void)loadActivityData:(void (^)(NSArray *data, NSError *error))completeBlock;

@end
