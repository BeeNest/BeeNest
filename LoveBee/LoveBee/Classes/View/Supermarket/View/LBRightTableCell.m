//
//  LBRightTableCell.m
//  LoveBee
//
//  Created by vane on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBRightTableCell.h"
#import <Masonry.h>

@implementation LBRightTableCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"status";
    
    LBRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[LBRightTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UIImageView *imgView = [UIImageView new];
        [self.contentView addSubview:imgView];
        self.imgView = imgView;
        
        UIImageView *jxView = [UIImageView new];
        [self.contentView addSubview:jxView];
        self.jxView = jxView;
        
        UILabel *nameLabel = [UILabel new];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UIImageView *buyOneImage = [UIImageView new];
        [self.contentView addSubview:buyOneImage];
        self.buyOneImage = buyOneImage;
        
        UILabel *specificsLabel = [UILabel new];
        [self.contentView addSubview:specificsLabel];
        self.specificsLabel = specificsLabel;
        
        UILabel *priceLabel = [UILabel new];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel *market_priceLabel = [UILabel new];
        [self.contentView addSubview:market_priceLabel];
        self.market_priceLabel = market_priceLabel;
        
        UIButton *addButton = [UIButton new];
        [self.contentView addSubview:addButton];
        self.addButton = addButton;
        
        UIButton *reduceButton = [UIButton new];
        [self.contentView addSubview:reduceButton];
        self.reduceButton = reduceButton;
        
        UILabel *numLabel = [UILabel new];
        [self.contentView addSubview:numLabel];
        self.numLabel = numLabel;
        
        
    }
    
    return  self;
    
}
-(void)setModel:(LBSuperLeftTableViewModel *)model{
    
    _model = model;
    
    //1. 设置数据
    [self setMyViewData];
    //2. 设置frame
    [self setMyViewFrame];
    
    
}

-(void)setMyViewData{
    
    self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.img]]];
    self.jxView.image = [UIImage imageNamed:@"jingxuan.png"];
    
    self.nameLabel.text = self.model.name;
    self.nameLabel.font = kBigTextFont;
 
    
    if (self.model.pm_desc.length>0) {
       self.buyOneImage.image = [UIImage imageNamed:@"buyOne.png"];
        self.buyOneImage.hidden = NO;
    }else{
        self.buyOneImage.hidden = YES;
    }
    
    
    self.specificsLabel.text = self.model.specifics;
    self.specificsLabel.font = kSmallTextFont;
    [self.specificsLabel setTextColor:kGrayTextColor];
    
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",self.model.price];
    self.priceLabel.font = kMidTextFont;
    [self.priceLabel setTextColor:kRedTextColor];
    
    self.market_priceLabel.text = [NSString stringWithFormat:@"￥%@",self.model.market_price];
    self.market_priceLabel.font = kMidTextFont;
    [self.market_priceLabel setTextColor:kGrayTextColor];
    
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.numLabel.text = @"1";
    [self.numLabel setTextColor:[UIColor blackColor]];
    self.numLabel.font = kMidTextFont;
    
    if (self.numLabel.text.length>0) {
        self.numLabel.hidden = NO;
        [self.reduceButton setBackgroundImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
        [self.reduceButton addTarget:self action:@selector(reduceClick) forControlEvents:UIControlEventTouchUpInside];
        self.reduceButton.hidden = NO;
    }else{
        self.numLabel.hidden = YES;
        self.reduceButton.hidden = YES;
    }
    
   
    
    
    
}
-(void)addClick{
    
    NSLog(@"+++");
}
-(void)reduceClick{
    NSLog(@"----");
}
-(void)setMyViewFrame{
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.leading.mas_equalTo(self).offset(3);
        make.bottom.mas_equalTo(self).offset(-3);
        make.width.mas_equalTo(60);
        
    }];
    [self.jxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_top);
        make.leading.mas_equalTo(self.imgView.mas_trailing).offset(2);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(15);
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.jxView.mas_centerY);
        make.leading.mas_equalTo(self.jxView.mas_trailing);
        make.trailing.mas_equalTo(self).offset(5);

    }];
    [self.buyOneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.jxView.mas_leading);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(15);
    }];
    [self.specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.buyOneImage.mas_leading);
        make.top.mas_equalTo(self.buyOneImage.mas_bottom);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.specificsLabel.mas_leading);
        make.bottom.mas_equalTo(self.imgView.mas_bottom);
    }];
    [self.market_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.priceLabel.mas_top);
        make.leading.mas_equalTo(self.priceLabel.mas_trailing);
    }];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.trailing.bottom.mas_equalTo(self).offset(-3);
        
        
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.addButton.mas_centerY);
        make.trailing.mas_equalTo(self.addButton.mas_leading).offset(-10);
        
    }];
    [self.reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addButton.mas_top);
        make.trailing.mas_equalTo(self.numLabel.mas_leading).offset(-10);
        
    }];
    
}
@end
