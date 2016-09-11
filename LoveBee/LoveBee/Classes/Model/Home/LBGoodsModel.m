//
//  LBGoodsModel.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBGoodsModel.h"

@implementation LBGoodsModel

+ (instancetype)goodsWithDict:(NSDictionary *)dict{
    LBGoodsModel *model = [LBGoodsModel new];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
