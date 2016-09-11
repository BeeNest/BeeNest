//
//  LBBaseNavController.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBBaseNavController.h"

@interface LBBaseNavController ()

@end

@implementation LBBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置文字属性
    [self.navigationBar setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : kGrayTextColor,
                                                 NSFontAttributeName : [UIFont systemFontOfSize:17]
                                                 }];
    
    // 设置选染色
    [self.navigationBar setTintColor: kGrayTextColor];
    
}

#pragma mark - 设置状态栏
- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}



#pragma mark -设置TabBar
// 统一隐藏TabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.editing = YES;
    
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
