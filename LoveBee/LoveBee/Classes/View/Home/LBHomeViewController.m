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

@interface LBHomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

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
    
    [self.collectionView registerClass:[LBHomeCell class] forCellWithReuseIdentifier:@"Homecell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00];
    
    // 请求数据
    [self loadHomeData];
}

#pragma mark -请求数据
- (void)loadHomeData{
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel loadFreshHotData:^(NSArray *data, NSError *error) {
        weakSelf.viewModel.freshDataArray = data;
        [weakSelf.collectionView reloadData];
    }];
    
    [self.viewModel loadActivityData:^(NSArray *data, NSError *error) {
        weakSelf.viewModel.activityDataArray = data;
        [weakSelf.collectionView reloadData];
        [self.collectionView reloadData];
    }];
    
}



#pragma mark -UICollectionDelegate

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
