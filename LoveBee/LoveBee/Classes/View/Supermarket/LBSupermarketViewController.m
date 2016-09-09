//
//  LBSupermarketViewController.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBSupermarketViewController.h"
#import "LBSuperLeftTableViewModel.h"

@interface LBSupermarketViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (strong, nonatomic) NSArray <LBSuperLeftTableViewModel *>*dataArray;
@property (strong, nonatomic) NSArray *rightDataArray;
//左边选中的
@property (copy, nonatomic) NSString *selectLeftNameStr;


@end

@implementation LBSupermarketViewController

-(void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.leftTableView reloadData];

    
}
-(void)setRightDataArray:(NSArray *)rightDataArray{
    
    _rightDataArray = rightDataArray;
    
    [self.rightTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [LBSuperLeftTableViewModel productWithLeftTableView:YES success:^(NSArray<LBSuperLeftTableViewModel *> *array) {
   
        self.dataArray = array;
        
        NSLog(@"3:%@",self.dataArray);
        
    } error:^{
        
        NSLog(@"获取失败");
    }];
    
    [LBSuperLeftTableViewModel productWithLeftTableView:false success:^(NSArray<LBSuperLeftTableViewModel *> *array) {
        
        self.rightDataArray = array;
        
        NSLog(@"4:%@",self.rightDataArray);
        
    } error:^{
        
        NSLog(@"获取失败");
    }];

    
    
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
        
        LBSuperLeftTableViewModel *model = self.dataArray[indexPath.row];
        
        cell.textLabel.text = model.name;
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
