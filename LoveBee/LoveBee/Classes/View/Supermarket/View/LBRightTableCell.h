//
//  LBRightTableCell.h
//  LoveBee
//
//  Created by vane on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSuperLeftTableViewModel.h"

@interface LBRightTableCell : UITableViewCell
//品名
@property(nonatomic,weak)UILabel *nameLabel;
//图片
@property(nonatomic,weak)UIImageView *imgView;
//规格
@property(nonatomic,weak)UILabel *specificsLabel;
//买一赠一
@property(nonatomic,weak)UIImageView *buyOneImage;
//原价
@property(nonatomic,weak)UILabel *market_priceLabel;
//优惠价
@property(nonatomic,weak)UILabel *priceLabel;
//加
@property(nonatomic,weak)UIButton *addButton;
//减
@property(nonatomic,weak)UIButton *reduceButton;
//数量
@property(nonatomic,weak)UILabel *numLabel;
//精选
@property(nonatomic,weak)UIImageView *jxView;
@property(strong, nonatomic) LBSuperLeftTableViewModel * model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
