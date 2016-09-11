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

@interface LBHomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

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
        _collectionView = [[UICollectionView alloc]initWithFrame:kScreenBounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizesSubviews = YES;
        
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
    self.view = self.collectionView;
    
    // 注册cell
    [self.collectionView registerClass:[LBHomeCell class] forCellWithReuseIdentifier:@"Homecell"];
    [self.collectionView registerClass:[LBHomeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headCell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];

    // 请求数据
    [self loadHomeData];
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
    return CGSizeZero;
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
