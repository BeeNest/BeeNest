//
//  LBGoodsModel.h
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBGoodsModel : NSObject

/*
 partner_price = 9.90;
	tag_ids = 5;
	specifics = 400g/盒;
	pm_desc = 买一赠一;
	dealer_id = 7951;
	market_price = 12.00;
	sort = 1;
	safe_day = 0;
	cart_group_id = 0;
	hot_degree = 0;
	img = http://img01.bqstatic.com/upload/goods/000/009/4576/0000094576_34960.jpg@300w_300h_90Q.jpg;
	attribute = ;
	store_nums = 50;
	name = 爱鲜蜂·江西贡桔;
	brand_id = 128;
	is_xf = 1;
	source_id = 1;
	cid = 106;
	id = 94576;
	is_del = 0;
	ismix = 0;
	product_id = 94576;
	number = 3;
	had_pm = 1;
	pre_img = 0000094576_34960.jpg;
	pre_imgs = 0000094576_27260.jpg,;
	brand_name = 爱鲜蜂;
	pcid = 55;
	category_id = 106;
	price = 9.90;
 */

#pragma mark -商品属性

///对应类里的明细
@property (nonatomic, copy) NSString *id;
/// 商品图片
@property (nonatomic, copy) NSString *img;

/// 商品名称
@property (nonatomic, copy) NSString *name;

/// 是否是精选
@property (nonatomic, assign) NSInteger is_xf;

/// 是否买一赠一
@property (nonatomic, copy) NSString *pm_desc;

/// 详细描述
@property (nonatomic, copy) NSString *specifics;

/// 当前价格
@property (nonatomic, copy) NSString *price;

/// 原价
@property (nonatomic, copy) NSString *market_price;

/// 库存数量
@property (nonatomic, assign) NSInteger number;

/// 记录用户选择的商品的次数
@property (nonatomic, assign) NSInteger userBuyCount;

+ (instancetype)goodsWithDict:(NSDictionary *)dict;

@end
