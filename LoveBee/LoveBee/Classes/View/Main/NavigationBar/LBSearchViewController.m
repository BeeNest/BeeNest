//
//  LBSearchViewController.m
//  LoveBee
//
//  Created by vane on 16/9/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSearchViewController.h"
#import "LBSearchViewModel.h"
#import "XLSphereView.h"
#import "LBHomeCell.h"
#import <UIImageView+WebCache.h>

@interface LBSearchViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate>
@property (nonatomic,strong) NSArray *keyWordArr;

@property (nonatomic,strong) XLSphereView *sphereView;

@property (nonatomic,strong)UISearchBar *searchView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *searchData;


@end

@implementation LBSearchViewController
#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 8;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
        flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:kScreenBounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizesSubviews = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LBSearchViewModel keyWordWithSuccess:^(NSArray *array) {
        self.keyWordArr = array;
        
        [self setBtn:self.keyWordArr.count];
        
        
    } error:^{
       
        NSLog(@"获取数据失败");
    }];
    
    self.searchView = [UISearchBar new];
    
    self.searchView.placeholder = @"请输入商品名称";
    
    self.navigationItem.titleView = self.searchView;
    
    self.searchView.delegate = self;
    
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"   " style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self addSphereView];
    
    [self.collectionView registerClass:[LBHomeCell class] forCellWithReuseIdentifier:@"Homecell"];
    
    // 请求数据
    [self loadHomeData];
    
}

#pragma mark -请求数据
- (void)loadHomeData{
    
    [LBSearchViewModel searchDataWithSuccess:^(NSArray *array) {
        self.searchData = array;
    } error:^{
        NSLog(@"获取数据失败");

    }];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length>0) {
        [self.view addSubview:self.collectionView];

    }else{
        
        [self.collectionView removeFromSuperview];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.searchData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LBHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Homecell" forIndexPath:indexPath];
    
       cell.goods = self.searchData[indexPath.item];
    [cell layoutIfNeeded];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    return CGSizeMake((kScreenWidth - 2 * HomeCollectionViewCellMargin) * 0.5 - 4, kScreenHeigth * 0.3 + 50);
}
-(void)addSphereView{
   
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"llll"]];
    
    CGFloat sphereViewW = self.view.frame.size.width - 30 * 2;
    CGFloat sphereViewH = sphereViewW;
    _sphereView = [[XLSphereView alloc] initWithFrame:CGRectMake(30, 100, sphereViewW, sphereViewH)];
    [self.view addSubview:_sphereView];
}
-(void)setBtn:(NSInteger)count{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"%@", self.keyWordArr[i]] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.frame = CGRectMake(0, 0, 90, 30);
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setItems:array];


}

    
- (void)buttonPressed:(UIButton *)btn
{
    [_sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [_sphereView timerStart];
        }];
    }];

    self.searchView.text = btn.titleLabel.text;
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeigth);
    
    NSLog(@"%zd",self.tabBarController.tabBar.isHidden);
    self.tabBarController.tabBar.hidden = NO;

}




@end
