//
//  LBgoodsViewController.m
//  
//
//  Created by hou_qingwei on 16/9/8.
//
//

#import "LBgoodsViewController.h"

@interface LBgoodsViewController ()

@end

@implementation LBgoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated{
    //显示 导航栏
    self.navigationController.navigationBar.hidden = NO;
}

//-(void)dealloc{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
