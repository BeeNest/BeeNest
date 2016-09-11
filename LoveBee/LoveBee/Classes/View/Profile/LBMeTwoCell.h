//
//  LBMeTwoCell.h
//  LoveBee
//
//  Created by hou_qingwei on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBMeTwoCell : UITableViewCell

//待收款
@property (weak, nonatomic) IBOutlet UIButton *payButton;
//待收货
@property (weak, nonatomic) IBOutlet UIButton *consigneeButton;
//待评价
@property (weak, nonatomic) IBOutlet UIButton *judgeButton;
//退款
@property (weak, nonatomic) IBOutlet UIButton *refundButton;
//待收款 图片
@property (weak, nonatomic) IBOutlet UIImageView *payImage;
//button label
@property (weak, nonatomic) IBOutlet UILabel *paylabel;
@property (weak, nonatomic) IBOutlet UIImageView *button2image;
@property (weak, nonatomic) IBOutlet UILabel *button2label;
@property (weak, nonatomic) IBOutlet UIImageView *button3image;
@property (weak, nonatomic) IBOutlet UILabel *button3label;
@property (weak, nonatomic) IBOutlet UIImageView *button4image;
@property (weak, nonatomic) IBOutlet UILabel *button4label;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
