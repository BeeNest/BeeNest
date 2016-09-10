//
//  LBMeorderViewController.m
//  LoveBee
//
//  Created by hou_qingwei on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBMeorderViewController.h"

@interface LBMeorderViewController ()

@end

@implementation LBMeorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
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
