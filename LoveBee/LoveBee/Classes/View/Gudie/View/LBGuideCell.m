//
//  LBGuideCell.m
//  LoveBee
//
//  Created by hou_qingwei on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBGuideCell.h"

@interface LBGuideCell ()

@property (weak, nonatomic) UIImageView* imageView;
@end
@implementation LBGuideCell
- (UIImageView*)imageView
{
    if (!_imageView) {
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.frame = [UIScreen mainScreen].bounds;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (void)setImage:(UIImage*)image
{
    _image = image;
    
    // 把数据放在控件上
    self.imageView.image = image;
}

@end
