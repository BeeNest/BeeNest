//
//  LBHomeCell.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeCell.h"
#import "LBPriceView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "LBBuyView.h"

@interface LBHomeCell ()

/// 商品图片
@property (nonatomic, strong) UIImageView *goodsImageView;

/// 商品名称
@property (nonatomic, strong) UILabel *goodsNameLabel;

/// 精选图标
@property (nonatomic, strong) UIImageView *fineImageView;

/// 买一赠送图标
@property (nonatomic, strong) UIImageView *giveImageView;

/// 细节描述Label
@property (nonatomic, strong) UILabel *specificsLabel;

/// 价格View
@property (nonatomic, strong) LBPriceView *priceView;

/// 加减商品View
@property (nonatomic, strong) LBBuyView *buyView;


@end


@implementation LBHomeCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

#pragma mark -设置视图
- (void)setupUI{
    
    // 初始化控件
    self.goodsImageView = [[UIImageView alloc]init];
    self.goodsImageView.image = [UIImage imageNamed:@"v2_placeholder_square"];
    self.goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.goodsNameLabel = [[UILabel alloc]init];
    self.goodsNameLabel.text = @"商品";
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.textColor = [UIColor blackColor];
    self.goodsNameLabel.textAlignment = NSTextAlignmentLeft;
    self.goodsNameLabel.numberOfLines = 1;
    
    self.fineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jingxuan.png"]];
    
    self.giveImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buyOne.png"]];
    
    self.specificsLabel = [[UILabel alloc]init];
    self.specificsLabel.text = @"asdhfiuvlb";
    self.specificsLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    self.specificsLabel.font = [UIFont systemFontOfSize:12];
    self.specificsLabel.textAlignment = NSTextAlignmentLeft;
    
    self.priceView = [[LBPriceView alloc]init];
    
    self.buyView = [[LBBuyView alloc]init];
    
    // 添加控件
    [self addSubview:_goodsImageView];
    [self addSubview:_goodsNameLabel];
    [self addSubview:_fineImageView];
    [self addSubview:_giveImageView];
    [self addSubview:_specificsLabel];
    [self addSubview:_priceView];
    [self addSubview:_buyView];
//
    // 添加约束
    __weak typeof(self) weakSelf = self;
    [weakSelf.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.width.equalTo(self.mas_width);
    }];
    [weakSelf.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_bottom);
        make.leading.mas_equalTo(weakSelf).mas_offset(10);
        make.trailing.mas_equalTo(weakSelf).mas_offset(-10);
        make.height.mas_equalTo(20);
    }];
    [weakSelf.fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsNameLabel.mas_bottom).offset(3);
        make.leading.equalTo(_goodsNameLabel);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(13);
    }];
    [weakSelf.giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fineImageView);
        make.leading.equalTo(_fineImageView.mas_trailing).offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(13);
    }];
    [weakSelf.specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_giveImageView.mas_bottom).mas_offset(5);
        make.leading.equalTo(_goodsNameLabel);
    }];
    [weakSelf.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(weakSelf.specificsLabel);
        make.top.mas_equalTo(weakSelf.specificsLabel.mas_bottom);
        make.trailing.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(weakSelf);
    }];
    
    [weakSelf.buyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.mas_equalTo(weakSelf).mas_offset(-2);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(65);
    }];
    
}

- (void)setGoods:(LBGoodsModel *)goods{
    _goods = goods;
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
    
    _goodsNameLabel.text = goods.name;
    
    _fineImageView.hidden = !(goods.is_xf == 1);
    
    _giveImageView.hidden = ![goods.pm_desc isEqualToString:@"买一赠一"];
    
    _specificsLabel.text = goods.specifics;
    
    _priceView.goods = goods;
    
    _buyView.goods = goods;
}


@end
