//
//  LBSuperLeftTableViewModel.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSuperLeftTableViewModel.h"
#import "AFHTTPTool.h"
#import "SVProgressHUD.h"

@implementation LBSuperLeftTableViewModel


+ (void)productWithSuccess:(void(^)(NSArray*array))successBlock error:(void(^)())errorBlock{
    
    
    NSMutableArray *mArray = [NSMutableArray array];

   [[AFHTTPTool sharedManager] superDataWithSuccess:^(id response) {
       NSDictionary *data = response[@"data"];
       
       NSArray *array = data[@"categories"];
       
       [array enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
           LBGoodsModel *model = [LBGoodsModel goodsWithDict:obj];
           [mArray addObject:model];
           
       }];
       
       
       if (successBlock) {
           successBlock(mArray.copy);
       }
       
   } failure:^(NSError *error) {
       if (error) {
           errorBlock(error);
       }
   }];
    
    
    
}
+ (void)productWithID:(NSString *)ID success:(void(^)(NSArray *array))successBlock error:(void(^)())errorBlock{
    
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    [[AFHTTPTool sharedManager] superDataWithSuccess:^(id response) {
        
        
        NSDictionary *data = response[@"data"];
        
        NSDictionary *productData = data[@"products"];
        
        NSArray *array = productData[ID];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LBGoodsModel *model = [LBGoodsModel goodsWithDict:obj];

            [mArray addObject:model];
            
            
        }];
        
        
        if (successBlock) {
            successBlock(mArray.copy);
        }
    } failure:^(NSError *error) {
        if (error) {
            errorBlock(error);
        }
        
        
    }];
    
}

@end
