//
//  LBSupermarketViewController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSupermarketViewController.h"

@interface LBSupermarketViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *rightDataArray;
//左边选中的
@property (copy, nonatomic) NSString *selectLeftNameStr;


@end

@implementation LBSupermarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"4",@"1", @"2", @"3"] ;
    
    self.rightDataArray = @[@{@"1":@[@"小吃", @"烧烤", @"蛋糕"]},@{@"2":@[@"酒店1", @"烧烤", @"蛋糕"]},@{@"3":@[@"丽人1", @"烧烤", @"蛋糕"]},@{@"4":@[@"休闲娱乐1", @"烧烤", @"蛋糕"]}];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.dataArray.count;
    } else {
        
        NSInteger count = 0;
        for (NSDictionary *dict in self.rightDataArray) {
            NSArray *array = dict[self.selectLeftNameStr];

            if (array.count >0) {
                
                count = array.count;
            }

        }
  
        return count;
        
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (tableView == self.leftTableView) {
        cell.textLabel.text = self.dataArray[indexPath.row];
    } else {
        
        NSArray *array = nil;
        for (NSDictionary *dict in self.rightDataArray) {
            
            array = dict[self.selectLeftNameStr];
            
            if (array.count>0) {
                
                cell.textLabel.text = array[indexPath.row];

            }
            
        }

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1. 只有选中左边才需要记录
    //开发中, 一般记录选中的左边模型
    if (tableView == self.leftTableView) {
        self.selectLeftNameStr = self.dataArray[indexPath.row];
        //2. 刷新表格
        [self.rightTableView reloadData];
    }
}


@end
