//
//  LBUserShopCar.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBUserShopCar.h"

@implementation LBUserShopCar

+ (instancetype)sharedShopCar{
    static dispatch_once_t onceToken;
    static LBUserShopCar *shopCar;
    dispatch_once(&onceToken, ^{
        if (!shopCar) {
            shopCar = [[LBUserShopCar alloc]init];
        }
    });
    return shopCar;
}

- (NSMutableArray<LBGoodsModel *> *)shopCar{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
        
    }
    return _shopCar;
}

#pragma mark -添加商品
- (void)addGoodsToShopCar:(LBGoodsModel *)goods{
    
    // 遍历当前购物车判断当前添加的商品是否已经存在
    for (LBGoodsModel *obj in self.shopCar) {
        if (obj == goods) {
            return;
        }
    }
    
    [self.shopCar addObject:goods];
}

#pragma mark -删除商品
- (void)removeGoodsFromShopCar:(LBGoodsModel *)goods{
    
    for (LBGoodsModel *obj in self.shopCar) {
        if (obj == goods) {
            [self.shopCar removeObject:goods];
            return;
        }
    }
}

#pragma mark -获取商品总数量
- (NSInteger)getAllGoodsCountFromShopCar{
    __block NSInteger count = 0;
    
    [self.shopCar enumerateObjectsUsingBlock:^(LBGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userBuyCount;
    }];
    return count;
}


#pragma mark -获取商品总价格

@end
