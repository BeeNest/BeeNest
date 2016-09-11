//
//  LBRightTableViewCell.m
//  LoveBee
//
//  Created by vane on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBRightTableViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation LBRightTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    //1. 定义重用标识
    NSString *reuseId = @"cell";
    
    //2. 根据重用标识获取cell
    LBRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    //3. 如果cell不存在
    if (!cell) {
        //4. 创建cell
        cell = [[LBRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;

    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //图片
        UIImageView *imgView = [UIImageView new];
        [self.contentView addSubview:imgView];
        self.imgView = imgView;
        //精选
        UIImageView *jxImage = [UIImageView new];
        [self.contentView addSubview:jxImage];
        self.jxImage = jxImage;
        //品名
        UILabel *nameLabel = [UILabel new];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //买一赠一
        UIImageView *buyOneImage = [UIImageView new];
        [self.contentView addSubview:buyOneImage];
        self.buyOneImage = buyOneImage;
        //规格
        UILabel *specificsLabel = [UILabel new];
        [self.contentView addSubview:specificsLabel];
        self.specificsLabel = specificsLabel;
        //优惠价
        UILabel *priceLabel = [UILabel new];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        //原价
        UILabel *market_priceLabel = [UILabel new];
        [self.contentView addSubview:market_priceLabel];
        self.market_priceLabel = market_priceLabel;
        //横线
        UIView *lineView = [UIView new];
        [self.market_priceLabel addSubview:lineView];
        self.lineView = lineView;
       
        self.buyView = [[LBBuyView alloc]init];
        [self.contentView addSubview:_buyView];
    }
    return self;
}
-(void)setModel:(LBSuperLeftTableViewModel *)model{
    
    _model = model;
    
    //1. 设置数据
    [self setMyViewData];
    //2. 设置frame
    [self setMyViewFrame];
    
    
}
-(void)setMyViewData{
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.model.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_highlight"]];
    
    self.jxImage.image = [UIImage imageNamed:@"jingxuan.png"];
    
    self.nameLabel.text = self.model.name;
    self.nameLabel.font = kBigTextFont;
    
    if (self.model.pm_desc.length>0) {
        
        self.buyOneImage.image = [UIImage imageNamed:@"buyOne.png"];
    }
    
    self.specificsLabel.text = self.model.specifics;
    self.specificsLabel.font = kSmallTextFont;
    [self.specificsLabel setTextColor:kGrayTextColor];
    
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",self.model.price];
    self.priceLabel.font = kMidTextFont;
    [self.priceLabel setTextColor:kRedTextColor];
    
    self.market_priceLabel.text = [NSString stringWithFormat:@"¥ %@",self.model.market_price];
    self.market_priceLabel.font = kMidTextFont;
    [self.market_priceLabel setTextColor:kGrayTextColor];
    
    self.lineView.backgroundColor = self.market_priceLabel.textColor;
    self.buyView.model = self.model;
    
}

-(void)setMyViewFrame{
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.leading.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(60);
        
    }];
    [self.jxImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_top);
        make.leading.mas_equalTo(self.imgView.mas_trailing).offset(2);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(25);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.jxImage.mas_trailing);
        make.centerY.mas_equalTo(self.jxImage.mas_centerY);
        make.trailing.mas_equalTo(3);
        
    }];
    [self.buyOneImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(self.jxImage.mas_leading);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(30);
        
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
        
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
        make.leading.mas_equalTo(self.priceLabel.mas_trailing).offset(3);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.market_priceLabel.mas_leading);
        make.trailing.mas_equalTo(self.market_priceLabel.mas_trailing);
        make.centerY.mas_equalTo(self.market_priceLabel.mas_centerY);
        make.height.mas_equalTo(1);
    }];
    [self.buyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-5);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
}

@end
