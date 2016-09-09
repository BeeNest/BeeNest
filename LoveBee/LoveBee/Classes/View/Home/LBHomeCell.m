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

@end


@implementation LBHomeCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self setupUI];
    }
    return self;
}

#pragma mark -设置视图
- (void)setupUI{
    
    // 初始化控件
    self.goodsImageView = [[UIImageView alloc]init];
    self.goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.goodsNameLabel = [[UILabel alloc]init];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.textColor = [UIColor blackColor];
    self.goodsNameLabel.textAlignment = NSTextAlignmentLeft;
    self.fineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jingxuan.png"]];
    self.giveImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buyOne.png"]];
    self.specificsLabel = [[UILabel alloc]init];
    self.specificsLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    self.specificsLabel.font = [UIFont systemFontOfSize:12];
    self.specificsLabel.textAlignment = NSTextAlignmentLeft;
    
    
    // 添加控件
    [self addSubview:_goodsImageView];
    [self addSubview:_goodsNameLabel];
    [self addSubview:_fineImageView];
    [self addSubview:_giveImageView];
    [self addSubview:_specificsLabel];
    [self addSubview:_priceView];
    
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 添加约束
    __weak typeof(self) weakSelf = self;
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(weakSelf.contentView);
    }];
    [_goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_goodsImageView.mas_bottom);
        make.leading.trailing.mas_equalTo(weakSelf.contentView);
        make.height.mas_equalTo(20);
    }];
    [_fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.mas_equalTo(_goodsNameLabel);
        make.height.mas_equalTo(15);
    }];
    [_giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_fineImageView.mas_trailing);
        make.top.height.mas_equalTo(_fineImageView);
    }];
    
    
}
@end
