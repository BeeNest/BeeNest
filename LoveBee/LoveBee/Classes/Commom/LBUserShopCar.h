//
//  LBUserShopCar.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBGoodsModel.h"

@interface LBUserShopCar : NSObject

/// 购物车(保存用户添加的商品)
@property (nonatomic, strong) NSMutableArray <LBGoodsModel*> *shopCar;

+ (instancetype)sharedShopCar;
- (void)addGoodsToShopCar:(LBGoodsModel *)goods;
- (void)removeGoodsFromShopCar:(LBGoodsModel *)goods;
- (NSInteger)getAllGoodsCountFromShopCar;


@end
