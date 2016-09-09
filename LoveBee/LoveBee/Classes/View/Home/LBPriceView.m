//
//  LBPriceView.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBPriceView.h"

@interface LBPriceView ()

/// 原价
@property (nonatomic, strong) UILabel *marketPriceLabel;

/// 现价
@property (nonatomic, strong) UILabel *priceLabel;

/// 横线
@property (nonatomic, strong) UIView *lineView;

@end

@implementation LBPriceView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setupUI];
        
    }
    return self;
}

#pragma mark -设置视图
- (void)setupUI{
    
    // 初始化原价Label
    self.marketPriceLabel = [[UILabel alloc]init];
    self.marketPriceLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1];
    self.marketPriceLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.marketPriceLabel];
    
    // 初始化横线
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = self.marketPriceLabel.textColor;
    [self.marketPriceLabel addSubview:self.lineView];
    
    // 初始化现价label
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    self.priceLabel.textColor = [UIColor redColor];
    [self addSubview:self.priceLabel];
    
}

// 供外界赋值使用的方法
- (instancetype)initWithPrice:(NSString *)price marketPrice:(NSString *)marketPrice{
    self = [super init];
    if (self) {
        if (price != nil && price.length != 0) {
            _priceLabel.text = [NSString stringWithFormat:@"$ %@",price];
            [_priceLabel sizeToFit];
        }
        if (marketPrice != nil && marketPrice.length != 0) {
            _marketPriceLabel.text = [NSString stringWithFormat:@"$ %@",marketPrice];
            _hasMarketPrice = YES;
            [_marketPriceLabel sizeToFit];
        } else {
            _hasMarketPrice = NO;
        }
        
        if (marketPrice == price) {
            _hasMarketPrice = NO;
        } else {
            _hasMarketPrice = YES;
        }
        
        _marketPriceLabel.hidden = !_hasMarketPrice;
    }
    return self;
}



// 设置子控件frame
- (void)layoutSubviews{
    [super layoutSubviews];
    self.priceLabel.frame = CGRectMake(0, 0, self.priceLabel.frame.size.width, self.frame.size.height);
    
    if (_hasMarketPrice) {
        _marketPriceLabel.frame = CGRectMake(CGRectGetMaxX(_priceLabel.frame) + 5, 0, _marketPriceLabel.frame.size.width, self.frame.size.height);
        _lineView.frame = CGRectMake(0, _marketPriceLabel.frame.size.height * 0.5 - 0.5, _marketPriceLabel.frame.size.width, 1);
    }
    
}



@end
