//
//  LBPriceView.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBPriceView : UIView

@property (nonatomic, assign) BOOL hasMarketPrice;

- (instancetype)initWithPrice:(NSString *)price marketPrice:(NSString *)marketPrice;

@end
