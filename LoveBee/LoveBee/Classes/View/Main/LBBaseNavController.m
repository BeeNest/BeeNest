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

/// 返回按钮
@property (nonatomic, strong) UIButton *backButton;

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
    
    // 初始化返回按钮
    self.backButton = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        btn.frame = CGRectMake(0, 0, 44, 40);
        btn;
    });
    

    
}

#pragma mark - 按钮点击事件
- (void)backButtonClick:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
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
    viewController.editing = YES;
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
    }
    
    
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
