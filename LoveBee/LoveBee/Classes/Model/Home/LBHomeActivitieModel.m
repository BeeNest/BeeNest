//
//  LBHomeActivitieModel.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeActivitieModel.h"

@implementation LBHomeActivitieModel

+ (instancetype)activityModelWithDict:(NSDictionary *)dict{
    LBHomeActivitieModel *model = [LBHomeActivitieModel new];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end