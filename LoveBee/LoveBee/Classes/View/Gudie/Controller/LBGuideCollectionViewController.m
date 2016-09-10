//
//  LBGuideCollectionViewController.m
//  LoveBee
//
//  Created by hou_qingwei on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBGuideCollectionViewController.h"
#import "LBTabBarController.h"
#import "LBGuideCell.h"
#import "UIView+Frame.h"
@interface LBGuideCollectionViewController ()
@property (weak, nonatomic) UIPageControl *pageControl;

@end

@implementation LBGuideCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

// 重写init方法 创建的时候 使用这个方法里面的布局
- (instancetype)init
{
    // 创建布局
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 大小
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    // 方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 左右间距
    layout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:layout];
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout*)layout
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 注册单元格
    [self.collectionView registerClass:[LBGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 取消弹性的效果
    self.collectionView.bounces = NO;
    // 分页
    self.collectionView.pagingEnabled = YES;
    // 不显示滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    CGFloat w = self.view.frame.size.width;
         CGFloat h = self.view.frame.size.height;
         for (int i = 0; i< 4; i++) {
                UIImageView *imageView = [[UIImageView alloc] init];
        
             // 1.设置frame
             imageView.frame = CGRectMake(i * w, 0, w, h);
        
                 // 2.设置图片
                  NSString *imgName = [NSString stringWithFormat:@"0%d.jpg", i + 1];
                   imageView.image = [UIImage imageNamed:imgName];
        
                [self.collectionView addSubview:imageView];
         }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.center = CGPointMake(w * 0.5, h - 20);
         pageControl.bounds = CGRectMake(0, 0, 150, 50);
         pageControl.numberOfPages = 4; // 一共显示多少个圆点（多少页）
         // 设置非选中页的圆点颜色
         pageControl.pageIndicatorTintColor = [UIColor redColor];
         // 设置选中页的圆点颜色
         pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
         // 禁止默认的点击功能
         pageControl.enabled = NO;
    
         [self.view addSubview:pageControl];
         _pageControl = pageControl;
    // 创建一个进入按钮
    UIButton* enterBtn = [[UIButton alloc] init];
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
    [enterBtn sizeToFit];
    enterBtn.x = 3 * kScreenWidth + (kScreenWidth - enterBtn.w) * 0.5;
    enterBtn.y = kScreenHeigth * 0.9;
    // 监听点击事件
    [enterBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.collectionView addSubview:enterBtn];

}
// 点击进入按钮的点击事件
- (void)enter
{
    // 创建tabbarController
    LBTabBarController* tab = [[LBTabBarController alloc] init];
    // 切换window的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
}

// 有多少个cell
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    // 缓存池找
    LBGuideCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 获取数据
    
    // 获取图片的名字
    NSString* imageName = [NSString stringWithFormat:@"guide_35_%ld", indexPath.row + 1];
    // 获取图片
    UIImage* image = [UIImage imageNamed:imageName];
    
    // 把数据传给cell
    cell.image = image;
    if (indexPath.row == 3) {
        self.pageControl.alpha = 0;
    }
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page =  self.collectionView.contentOffset.x / self.view.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    _pageControl.currentPage = page;
}

// 随机颜色
- (UIColor*)randomColor
{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
