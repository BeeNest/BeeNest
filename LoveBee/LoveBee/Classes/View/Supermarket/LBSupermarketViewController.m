//
//  LBSupermarketViewController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSupermarketViewController.h"
#import "LBSuperLeftTableViewModel.h"
#import "LBRightTableCell.h"

@interface LBSupermarketViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (strong, nonatomic) NSArray <LBSuperLeftTableViewModel *>*dataArray;
@property (strong, nonatomic) NSArray <LBSuperLeftTableViewModel *>*rightDataArray;
//左边选中的
@property (copy, nonatomic) NSString *selectLeftNameStr;


@end

@implementation LBSupermarketViewController

-(void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    
    [self.leftTableView reloadData];
    
    NSIndexPath *path=[NSIndexPath indexPathForItem:0 inSection:0];
    [self.leftTableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.leftTableView didSelectRowAtIndexPath:path];
    
    
}
-(void)setRightDataArray:(NSArray *)rightDataArray{
    
    _rightDataArray = rightDataArray;
    
    [self.rightTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [LBSuperLeftTableViewModel categoriesWithSuccess:^(NSArray<LBSuperLeftTableViewModel *> *array) {
   
        self.dataArray = array;
        
//        NSLog(@"3:%@",self.dataArray);
        
    } error:^{
        
        NSLog(@"获取失败1");
    }];
  


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.dataArray.count;
    } else {
        return  self.rightDataArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == self.leftTableView) {
        
        static NSString *cellID = @"leftCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        LBSuperLeftTableViewModel *model = self.dataArray[indexPath.row];
        
        cell.textLabel.text = model.name;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
        
    } else {
        

        LBRightTableCell *cell = [LBRightTableCell cellWithTableView:tableView];
        
        cell.model = self.rightDataArray[indexPath.row];
        
        return cell;

    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //记录选中的左边
    if (tableView == self.leftTableView) {
        self.selectLeftNameStr = self.dataArray[indexPath.row].id;
        NSLog(@"id:%@",self.selectLeftNameStr);
        
        [LBSuperLeftTableViewModel productWithID:self.selectLeftNameStr success:^(NSArray<LBSuperLeftTableViewModel *> *array) {
            self.rightDataArray = array;
//            NSLog(@"%ld:%@",self.rightDataArray.count,self.rightDataArray);
            
        } error:^{
            NSLog(@"获取失败");
        }];
        
        
        //2. 刷新表格
        [self.rightTableView reloadData];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.rightTableView) {
        
        return 64;
    }
    return 44;
}

@end
