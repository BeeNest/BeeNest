//
//  LBBuyView.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBGoodsModel.h"
#import "LBSuperLeftTableViewModel.h"

@interface LBBuyView : UIView

/// 商品模型
@property (nonatomic, strong) LBGoodsModel *goods;

@property (nonatomic,strong) LBSuperLeftTableViewModel *model;

@end
