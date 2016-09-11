//
//  LBHomeViewModel.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBGoodsModel.h"

@interface LBHomeViewModel : NSObject

@property (nonatomic, strong) NSArray<LBGoodsModel *> *dataArray;

- (void)loadFreshHotDataWithSuccess:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

@end
