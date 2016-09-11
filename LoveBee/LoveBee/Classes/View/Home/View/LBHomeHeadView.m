//
//  LBHomeHeadView.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeHeadView.h"

@interface LBHomeHeadView ()

/// 标题Label
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LBHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化控件
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
        _titleLabel.text = @"新鲜热卖";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        [_titleLabel sizeToFit];
        // 添加控件
        [self addSubview:_titleLabel];
    }
    return self;
}

@end
