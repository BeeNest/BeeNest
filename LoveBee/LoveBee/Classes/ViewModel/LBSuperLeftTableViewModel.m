//
//  LBSuperLeftTableViewModel.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSuperLeftTableViewModel.h"
#import "AFHTTPTool.h"

@implementation LBSuperLeftTableViewModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    LBSuperLeftTableViewModel *model = [[LBSuperLeftTableViewModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+(void)productWithLeftTableView:(BOOL)isTrue success:(void(^)(NSArray<LBSuperLeftTableViewModel *> *array))successBlock error:(void(^)())errorBlock{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    AFHTTPTool *manager = [AFHTTPTool sharedManager];
    
    
    NSDictionary *parm = @{@"call":@"5"};
    
    [manager postWithUrl:@"http://iosapi.itcast.cn/loveBeen/supermarket.json.php" params:parm success:^(NSDictionary* responseObject) {
        
        NSDictionary *data = responseObject[@"data"];
        
        NSArray *array = [NSArray array];
        
        if (isTrue) {
            
        array = data[@"categories"];
            
        }else{
         
            array = data[@"products"];
        }

        
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
