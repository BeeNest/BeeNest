//
//  LBSearchViewModel.m
//  LoveBee
//
//  Created by vane on 16/9/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSearchViewModel.h"
#import "AFHTTPTool.h"
#import "LBGoodsModel.h"

@implementation LBSearchViewModel
+(void)keyWordWithSuccess:(void (^)(NSArray *))successBlock error:(void (^)())errorBlock{
    
    
    [[AFHTTPTool sharedManager] keyWordWithSuccess:^(id response) {
        
        NSDictionary *data = response[@"data"];
        
        NSArray *array = data[@"hotquery"];
        
        if (successBlock) {
            successBlock(array.copy);
        }
        
    } failure:^(NSError *error) {
        if (error) {
            errorBlock(error);
        }
        
    }];
    
    
}
+(void)searchDataWithSuccess:(void (^)(NSArray *))successBlock error:(void (^)())errorBlock{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    [[AFHTTPTool sharedManager] searchDataWithSuccess:^(id response) {
        
        NSArray *data = response[@"data"];
        
        [data enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
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
