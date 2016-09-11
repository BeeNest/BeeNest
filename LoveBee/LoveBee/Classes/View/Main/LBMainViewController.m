//
//  LBMainViewController.m
//  LoveBee
//
//  Created by vane on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBMainViewController.h"

@interface LBMainViewController ()

@end

@implementation LBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    self.navigationItem.leftBarButtonItem = [self itemWithImgName:@"icon_black_scancode" Action:@selector(sweepClick)];
    
    self.navigationItem.rightBarButtonItem = [self itemWithImgName:@"icon_search" Action:@selector(searchClick)];
    

}
-(void)sweepClick{
    
    NSLog(@"扫一扫");
}
-(void)searchClick{
    
    NSLog(@"搜索");
    
}
-(UIBarButtonItem *)itemWithImgName:(NSString *)imgName Action:(SEL)action{
    
    UIButton*btn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
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
