//
//  LBHomeCell.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBGoodsModel.h"

typedef enum : NSInteger {
    LBHomeCellTypeVertical,
    LBHomeCellTypeHorizontal
} LBHomeCellType;

@interface LBHomeCell : UICollectionViewCell

/// 商品模型
@property (nonatomic, strong) LBGoodsModel *goods;


/// cell类型
@property (nonatomic, assign) LBHomeCellType cellType;

/// 活动背景图片
@property (nonatomic, strong) UIImageView *backImageView;

@end
