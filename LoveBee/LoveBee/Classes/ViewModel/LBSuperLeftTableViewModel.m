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
+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    LBSuperLeftTableViewModel *model = [[LBSuperLeftTableViewModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+(void)productWithSuccess:(void(^)(NSArray<LBSuperLeftTableViewModel *> *array))successBlock error:(void(^)())errorBlock{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    AFHTTPTool *manager = [AFHTTPTool sharedManager];
    
    
    NSDictionary *parm = @{@"call":@"5"};
    
    
    
    [manager postWithUrl:@"http://iosapi.itcast.cn/loveBeen/supermarket.json.php" params:parm success:^(NSDictionary* responseObject) {
        
        NSDictionary *data = responseObject[@"data"];
        
        NSArray *array = data[@"categories"];
    
        [array enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LBSuperLeftTableViewModel *model = [LBSuperLeftTableViewModel modelWithDict:obj];
            [mArray addObject:model];
            
                
        }];
        
        
         if (successBlock) {
             successBlock(mArray.copy);
        }
    } failure:^(NSError *error) {
        if (error) {
            errorBlock();
        }
    }];
    
}
+(void)productWithID:(NSString *)ID success:(void(^)(NSArray<LBSuperLeftTableViewModel *> *array))successBlock error:(void(^)())errorBlock{
    
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    AFHTTPTool *manager = [AFHTTPTool sharedManager];
    
    
    NSDictionary *parm = @{@"call":@"5"};
    
    [manager postWithUrl:@"http://iosapi.itcast.cn/loveBeen/supermarket.json.php" params:parm success:^(NSDictionary* responseObject) {
        
        NSDictionary *data = responseObject[@"data"];
        
        NSDictionary *productData = data[@"products"];
        
        NSArray *array = productData[ID];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LBSuperLeftTableViewModel *model = [LBSuperLeftTableViewModel modelWithDict:obj];
            [mArray addObject:model];
            
            
        }];
        
        
        if (successBlock) {
            successBlock(mArray.copy);
        }
    } failure:^(NSError *error) {
        if (error) {
            errorBlock();
        }
    }];
    
    
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@", self.name,self.id,self.img,self.specifics,self.pm_desc,self.price,self.market_price];
}
@end
