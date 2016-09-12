//
//  LBRightTableViewCell.h
//  LoveBee
//
//  Created by vane on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSuperLeftTableViewModel.h"
#import "LBBuyView.h"
#import "LBGoodsModel.h"

@protocol LBRightTableViewCellDelegate <NSObject>

@optional
-(void)click:(UIButton *)button;

@end

@interface LBRightTableViewCell : UITableViewCell
//图片
@property(nonatomic,weak)UIImageView *imgView;
//精选
@property(nonatomic,weak)UIImageView *jxImage;
//品名
@property(nonatomic,weak)UILabel *nameLabel;
//买一赠一
@property(nonatomic,weak)UIImageView *buyOneImage;
//规格
@property(nonatomic,weak)UILabel *specificsLabel;
//优惠价
@property(nonatomic,weak)UILabel *priceLabel;
//原价
@property(nonatomic,weak)UILabel *market_priceLabel;
//横线
@property(nonatomic,weak)UIView *lineView;
/// 加减商品View
@property (nonatomic, strong) LBBuyView *buyView;


@property(strong, nonatomic)LBGoodsModel  *model;

@property (strong, nonatomic) id <LBRightTableViewCellDelegate>cellDelegate;
+(instancetype)cellWithTableView:(UITableView*)tableView;


@end
