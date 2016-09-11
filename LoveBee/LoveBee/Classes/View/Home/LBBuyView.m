//
//  LBBuyView.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBBuyView.h"
#import <Masonry.h>

@interface LBBuyView ()

/// 加号按钮
@property (nonatomic, strong) UIButton *addButton;

/// 减号按钮
@property (nonatomic, strong) UIButton *cutButton;

/// 数量
@property (nonatomic, strong) UILabel *numberLabel;

/// 无货Label
@property (nonatomic, strong) UILabel *emptyLabel;

/// 记录用户选择商品的数量
@property (nonatomic, assign) NSInteger indexNumber;

@end

@implementation LBBuyView

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // 添加控件
    _addButton = [[UIButton alloc]init];
    [_addButton setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
    
    _cutButton = [[UIButton alloc]init];
    [_cutButton setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [_cutButton addTarget:self action:@selector(cutButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _cutButton.hidden = YES;
    [self addSubview:_cutButton];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.text = @"0";
    _numberLabel.font = [UIFont systemFontOfSize:12];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    _numberLabel.hidden = YES;
    [self addSubview:_numberLabel];
    
    _emptyLabel = [[UILabel alloc]init];
    _emptyLabel.text = @"补货中";
    _emptyLabel.textColor = kRedTextColor;
    _emptyLabel.font = [UIFont systemFontOfSize:14];
    _emptyLabel.textAlignment = NSTextAlignmentCenter;
    _emptyLabel.hidden = YES;
    [self addSubview:_emptyLabel];
    
    // 添加约束
    [_cutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_cutButton.mas_trailing).mas_offset(5);
        make.top.bottom.mas_equalTo(self);
        make.trailing.mas_equalTo(_addButton.mas_leading).mas_offset(-4);
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    return self;
}

// 给控件赋值的方法
- (void)setGoods:(LBGoodsModel *)goods{
    _goods = goods;
    _emptyLabel.hidden = !(goods.number <= 0);
    _addButton.hidden = goods.number <= 0;
    
}

- (void)setModel:(LBSuperLeftTableViewModel *)model{
    _model = model;
    _emptyLabel.hidden = !(model.number <= 0);
    _addButton.hidden = model.number <= 0;
}

// 设置已选择的商品数量
- (void)setIndexNumber:(NSInteger)indexNumber{
    _indexNumber = indexNumber;
    if (_indexNumber == 0) {
        _cutButton.hidden = YES;
        _numberLabel.hidden = YES;
    }else{
        _cutButton.hidden = NO;
        _numberLabel.hidden = NO;
        _numberLabel.text = [NSString stringWithFormat:@"%zd",_indexNumber];
    }
}


#pragma mark -按钮点击事件
// 加号按钮
- (void)addButtonClick:(UIButton *)sender{
    NSLog(@"加号按钮点击");
    self.indexNumber++;
}

// 减号按钮
- (void)cutButtonClick:(UIButton *)sender{
    NSLog(@"减号按钮点击");
    self.indexNumber--;
}


@end
