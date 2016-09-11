//
//  LBBaseNavController.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBBaseNavController.h"
#import "SVProgressHUD.h"

@interface LBBaseNavController ()

@end

@implementation LBBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:1.00 green:0.84 blue:0.00 alpha:1.00]];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置文字属性
    [self.navigationBar setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : [UIColor blackColor],
                                                 NSFontAttributeName : [UIFont systemFontOfSize:17]
                                                 }];
    
    // 设置选染色
    [self.navigationBar setTintColor: kGrayTextColor];
    
//    self.navigationBar.backgroundColor = [UIColor colorWithRed:1.00 green:0.73 blue:0.00 alpha:1.00];

    
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
