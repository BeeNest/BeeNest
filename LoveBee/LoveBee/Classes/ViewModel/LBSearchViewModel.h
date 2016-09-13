//
//  LBSearchViewModel.h
//  LoveBee
//
//  Created by vane on 16/9/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBSearchViewModel : NSObject
+(void)keyWordWithSuccess:(void(^)(NSArray *array))successBlock error:(void(^)())errorBlock;

+(void)searchDataWithSuccess:(void(^)(NSArray *array))successBlock error:(void(^)())errorBlock;
@end
