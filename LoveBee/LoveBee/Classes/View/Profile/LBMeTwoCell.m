//
//  LBMeTwoCell.m
//  LoveBee
//
//  Created by hou_qingwei on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBMeTwoCell.h"
@interface LBMeTwoCell()

@end
@implementation LBMeTwoCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    
    // 1.定义一个重用标识
    static NSString *ID = @"tg";
    // 2.先去缓存池找可重用的cell
    LBMeTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.如果缓存池没有可重用的cell,创建一个cell,并给cell绑定一个重用标识
    if (cell == nil) {
        //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LBMeTwoCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
