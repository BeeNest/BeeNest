//
//  LBMeFourCell.h
//  LoveBee
//
//  Created by hou_qingwei on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBMeFourCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@end
