//
//  LBSuperLeftTableViewModel.h
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBGoodsModel.h"

@interface LBSuperLeftTableViewModel : NSObject

//@property(nonatomic,strong) NSArray *leftDataArray;
//@property(nonatomic,strong) NSMutableArray *rightDataArray;

+(void)productWithSuccess:(void(^)(NSArray *array))successBlock error:(void(^)())errorBlock;
+(void)productWithID:(NSString *)ID success:(void(^)(NSArray *array))successBlock error:(void(^)())errorBlock;

@end
