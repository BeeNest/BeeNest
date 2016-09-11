//
//  LBSupermarketViewController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSupermarketViewController.h"
#import "LBSuperLeftTableViewModel.h"
#import "LBRightTableViewCell.h"
#import <SVProgressHUD.h>

@interface LBSupermarketViewController ()<UITableViewDataSource,UITableViewDelegate,LBRightTableViewCellDelegate>
@property (strong, nonatomic)  UITableView *leftTableView;
@property (strong, nonatomic)  UITableView *rightTableView;

@property (strong, nonatomic) NSArray <LBSuperLeftTableViewModel *>*dataArray;
@property (strong, nonatomic) NSArray<LBSuperLeftTableViewModel*> *rightDataArray;

@property(nonatomic,assign)NSInteger select;


@end

@implementation LBSupermarketViewController

-(void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.leftTableView reloadData];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.leftTableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionNone];

    [self tableView:self.leftTableView didSelectRowAtIndexPath:path];
    
   }
-(void)setRightDataArray:(NSArray *)rightDataArray{
    
    _rightDataArray = rightDataArray;
    
    [self.rightTableView reloadData];
}
-(UITableView *)leftTableView{
    
    if (!_leftTableView) {
        
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/3, kScreenHeigth-44)];
    }
    
    return _leftTableView;
}
-(UITableView *)rightTableView{
    
    if (!_rightTableView) {
        
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(kScreenWidth/3,64, kScreenWidth/3*2, kScreenHeigth-108)];
        
    }
    return _rightTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    
    [SVProgressHUD showWithStatus:@"正在加载中"];

    [LBSuperLeftTableViewModel productWithSuccess:^(NSArray<LBSuperLeftTableViewModel *> *array) {
   
        self.dataArray = array;
        

    } error:^{
        
        NSLog(@"获取失败");
    }];
    
    self.rightTableView.tableHeaderView.alpha = 0.1;
    self.leftTableView.tableFooterView = [UIView new];
    self.rightTableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.dataArray.count;
    } else {
        
        return self.rightDataArray.count;
        
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.leftTableView) {
        
        NSString *cellID = @"leftCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        LBSuperLeftTableViewModel *model = self.dataArray[indexPath.row];
        
        cell.textLabel.text = model.name;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
    } else {
        
        LBRightTableViewCell *cell = [LBRightTableViewCell cellWithTableView:tableView];
        
        cell.model = self.rightDataArray[indexPath.row];
        cell.cellDelegate = self;
        
        return cell;
        
    }

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (tableView == self.leftTableView) {
        
        self.select = indexPath.row;
        
        [LBSuperLeftTableViewModel productWithID:self.dataArray[indexPath.row].id success:^(NSArray<LBSuperLeftTableViewModel *> *array) {
            
            self.rightDataArray = array;
            
            [SVProgressHUD dismiss];
            
        } error:^{
            
            NSLog(@"获取失败");
        }];

        [self.rightTableView reloadData];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.rightTableView) {
        
        return 65;
    }
    return 44;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (tableView == self.rightTableView) {
        
        return self.dataArray[self.select].name;
        
    }
    return nil;
}


@end
