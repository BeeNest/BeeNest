//
//  LBHomeActivitieModel.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBHomeActivitieModel : NSObject

/// 图片URL
@property (nonatomic, copy) NSString *img;

/// 活动名称
@property (nonatomic, copy) NSString *name;

/// 跳转URL
@property (nonatomic, copy) NSString *customURL;

+ (instancetype)activityModelWithDict:(NSDictionary *)dict;

@end
