//
//  LBTabBarController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBTabBarController.h"

@interface LBTabBarController ()
@property(strong,nonatomic)NSArray *items;
@end

@implementation LBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    [self addTabBarInfo];
}
-(void)addTabBarWithNum:(NSInteger)num andTitle:(NSString *)title andImgName:(NSString*)imgName{
    UITabBarItem *item = self.items[num];
    
    item.title = title;
    
    [item setImage:[UIImage imageNamed:imgName]];
    

    UIImage *homeImageSel = [UIImage imageNamed:[NSString stringWithFormat:@"%@_r",imgName]];
    homeImageSel = [homeImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.selectedImage = homeImageSel;
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    
}
-(void)addTabBarInfo{
    
    
    self.items = self.tabBar.items;
    
    [self addTabBarWithNum:0 andTitle:@"首页" andImgName:@"v2_home"];
    [self addTabBarWithNum:1 andTitle:@"闪送超市" andImgName:@"v2_order"];
    [self addTabBarWithNum:2 andTitle:@"购物车" andImgName:@"shopCart"];
    [self addTabBarWithNum:3 andTitle:@"我的" andImgName:@"v2_my"];
    
    
    
    
}


-(void)addChildViewControllers{
    
    UINavigationController *home = [self boardWithName:@"Home"];
    UINavigationController *supermarket = [self boardWithName:@"Supermarket"];
    UINavigationController *shopping = [self boardWithName:@"Shopping"];
      UINavigationController *me = [self boardWithName:@"Me"];
    
    self.viewControllers = @[home,supermarket,shopping,me];
}

-(UINavigationController *)boardWithName:(NSString *)boardName{
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:boardName bundle:nil];
    
    UINavigationController *nav = [board instantiateInitialViewController];
    
    return nav;
}

@end
