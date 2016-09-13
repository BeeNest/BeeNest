//
//  LBHomeViewController.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBHomeViewController.h"
#import "LBHomeCell.h"
#import "LBHomeViewModel.h"
#import <UIImageView+WebCache.h>
#import "LBHomeHeadView.h"
#import "LBWebViewController.h"
#import "LBRefreshHeaderView.h"
#import "UINavigationBar+OverLay.h"

@interface LBHomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

/// home界面的Viewmodel
@property (nonatomic, strong) LBHomeViewModel *viewModel;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LBHomeViewController

#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 8;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
//        flowLayout.itemSize = CGSizeMake((kScreenWidth - 2 * HomeCollectionViewCellMargin) * 0.5 - 4, kScreenHeigth * 0.3 + 50);
        flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -64, kScreenWidth, kScreenHeigth) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.autoresizesSubviews = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
    
    
}

- (LBHomeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [LBHomeViewModel new];
    }
    return _viewModel;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view = self.collectionView;
    [self.view addSubview:self.collectionView];
    
    self.view.frame = CGRectMake(0, -64, kScreenWidth, kScreenHeigth);
    
    [self.navigationController.navigationBar jn_setBackgroundColor:[UIColor clearColor]];
    
    
    // 注册cell
    [self.collectionView registerClass:[LBHomeCell class] forCellWithReuseIdentifier:@"Homecell"];
    [self.collectionView registerClass:[LBHomeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headCell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    
    // 设置刷新
    [self setupRefresh];

    // 请求数据
    [self loadHomeData];
    
    self.tabBarController.tabBarItem.badgeValue = @"2";
}

#pragma mark -请求数据
- (void)loadHomeData{
    
    __weak typeof(self) weakSelf = self;
    
    // 请求新鲜热卖数据
    [self.viewModel loadFreshHotData:^(NSArray *data, NSError *error) {
        weakSelf.viewModel.freshDataArray = data;
        [weakSelf.collectionView reloadData];
    }];
    
    // 请求活动数据
    [self.viewModel loadActivityData:^(NSArray *data, NSError *error) {
        weakSelf.viewModel.activityDataArray = data;
        [weakSelf.collectionView reloadData];
        [self.collectionView reloadData];
    }];
}


- (void)setupRefresh{
    LBRefreshHeaderView *header = [LBRefreshHeaderView headerWithRefreshingTarget:self refreshingAction:@selector(headerRefeshData)];
    header.gifView.frame = CGRectMake(0, -64, 100, 100);
    _collectionView.mj_header = header;
    [_collectionView.mj_header beginRefreshing];
}
- (void)headerRefeshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collectionView.mj_header endRefreshing];
    });
}


#pragma mark - UICollectionViewDataSource,  UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return self.viewModel.activityDataArray.count;
    }
    
    return _viewModel.freshDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LBHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Homecell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.cellType = LBHomeCellTypeVertical;
        [cell.backImageView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.activityDataArray[indexPath.item].img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        return cell;
    }
    
    cell.goods = self.viewModel.freshDataArray[indexPath.item];
    [cell layoutIfNeeded];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth - 2*HomeCollectionViewCellMargin, kScreenHeigth/5);
    }
    return CGSizeMake((kScreenWidth - 2 * HomeCollectionViewCellMargin) * 0.5 - 4, kScreenHeigth * 0.3 + 50);
}

// 组头的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        return CGSizeMake(kScreenWidth, HomeCollectionViewCellMargin * 2);
    }
    return CGSizeMake(kScreenWidth, 300);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    
    LBHomeHeadView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark -cell点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 点击活动cell
    if (indexPath.section == 0) {
        LBWebViewController *webVc = [[LBWebViewController alloc]initWithActivityModel:self.viewModel.activityDataArray[indexPath.item]];
        
        [self.navigationController pushViewController:webVc animated:YES];
    }
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    UIColor * color = [UIColor colorWithRed:1.00 green:0.84 blue:0.00 alpha:1.00];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 50) {
        CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
        [self.navigationController.navigationBar jn_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar jn_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.collectionView.delegate = self;
    [self scrollViewDidScroll:self.collectionView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.collectionView.delegate = nil;
    [self.navigationController.navigationBar jn_reset];
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
