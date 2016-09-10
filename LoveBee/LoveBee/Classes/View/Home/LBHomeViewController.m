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
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 2 * HomeCollectionViewCellMargin) * 0.5 - 4, kScreenHeigth * 0.3 + 50);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:kScreenBounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizesSubviews = YES;
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.collectionView;
    
    [self.collectionView registerClass:[LBHomeCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00];
    
    // 请求数据
    [self loadFreshData];
    
}

#pragma mark -全局的方法
- (void)loadFreshData{
    
    self.viewModel = [[LBHomeViewModel alloc]init];
    
    [self.viewModel loadFreshHotDataWithSuccess:^(NSDictionary * response) {
        
        NSArray *data = response[@"data"];
        
        NSMutableArray *mArr = [NSMutableArray array];
        [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LBGoodsModel *model = [LBGoodsModel goodsWithDict:obj];
            [mArr addObject:model];
        }];
        self.viewModel.dataArray = mArr;
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        if (error) {
            NSLog(@"获取新鲜热卖信息失败");
        }
    }];
  
}

#pragma mark -UICollectionDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    }
    
    
    return _viewModel.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LBHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.cellType = LBHomeCellTypeVertical;
        return cell;
    }
    
    cell.goods = self.viewModel.dataArray[indexPath.item];
//    [cell layoutIfNeeded];
    
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
