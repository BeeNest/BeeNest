//
//  LBSuperLeftTableViewModel.h
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LBSuperLeftTableViewModel : NSObject
//类名,品名
@property(nonatomic,copy)NSString *name;
//对应类里的明细
@property(nonatomic,copy)NSString *id;
//图片
@property(nonatomic,copy)NSString *img;
//规格
@property(nonatomic,copy)NSString *specifics;
//买一赠一
@property(nonatomic,copy)NSString *pm_desc;
//原价
@property(nonatomic,copy)NSString *market_price;
//优惠价
@property(nonatomic,copy)NSString *price;
// 库存数量
@property (nonatomic, assign) NSInteger number;

+(instancetype)modelWithDict:(NSDictionary *)dict;

+(void)productWithSuccess:(void(^)(NSArray<LBSuperLeftTableViewModel *> *array))successBlock error:(void(^)())errorBlock;
+(void)productWithID:(NSString *)ID success:(void(^)(NSArray<LBSuperLeftTableViewModel *> *array))successBlock error:(void(^)())errorBlock;

@end
