//
//  LBLabelView.m
//  LoveBee
//
//  Created by vane on 16/9/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBLabelView.h"

@implementation LBLabelView

-(instancetype)init{
    
    self = [self init];
    
    if (self) {
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSInteger i = 0; i < 40; i ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            [btn setTitle:[NSString stringWithFormat:@"🍎%ld", i] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1.];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:24.];
            btn.frame = CGRectMake(0, 0, 60, 30);
            btn.layer.cornerRadius = 3;
            btn.clipsToBounds = YES;
            [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [array addObject:btn];
            [self addSubview:btn];
        }
        [self setItems:array];
    }
    return self;
}

@end
