//
//  LBMeCell.h
//  LoveBee
//
//  Created by hou_qingwei on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBMeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
