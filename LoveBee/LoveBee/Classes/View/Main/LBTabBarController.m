//
//  LBTabBarController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBTabBarController.h"
#import "LBBaseNavController.h"
#import "LBUserShopCar.h"

@interface LBTabBarController ()
@property(strong,nonatomic)NSArray *items;
@end

@implementation LBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    [self addTabBarInfo];
    
    
    [self addNotification];
    
}

#pragma mark -添加通知
- (void)addNotification{
    
    // 改变购物车角标
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopCarChangeBadgeValue:) name:LBShopCarChangeBadgeValue object:nil];
    
}

- (void)shopCarChangeBadgeValue:(NSNotification *)notification{
    
    UIViewController *shopCarVc = self.viewControllers[2];
    
    NSInteger count = [[LBUserShopCar sharedShopCar] getAllGoodsCountFromShopCar];
    NSLog(@"count = %zd",count);
    
    if (count == 0) {
        shopCarVc.tabBarItem.badgeValue = nil;
        return;
    }
    shopCarVc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",count];
    
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
    
    LBBaseNavController *home = [self boardWithName:@"Home"];
    LBBaseNavController *supermarket = [self boardWithName:@"Supermarket"];
    LBBaseNavController *shopping = [self boardWithName:@"Shopping"];
      LBBaseNavController *me = [self boardWithName:@"Me"];
    
    self.viewControllers = @[home,supermarket,shopping,me];
}

-(LBBaseNavController *)boardWithName:(NSString *)boardName{
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:boardName bundle:nil];
    
    LBBaseNavController *nav = [board instantiateInitialViewController];
    
    return nav;
}

@end
