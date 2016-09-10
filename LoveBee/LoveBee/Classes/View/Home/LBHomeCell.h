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

@property (nonatomic, strong) LBGoodsModel *goods;

/// cell类型
@property (nonatomic, assign) LBHomeCellType cellType;

@end
