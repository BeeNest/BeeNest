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

@interface LBSupermarketViewController ()<UITableViewDataSource,UITableViewDelegate,LBRightTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (strong, nonatomic) NSArray <LBSuperLeftTableViewModel *>*dataArray;
@property (strong, nonatomic) NSArray<LBSuperLeftTableViewModel*> *rightDataArray;

//记录数量

@property(nonatomic,assign)NSInteger *num;


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

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [LBSuperLeftTableViewModel productWithSuccess:^(NSArray<LBSuperLeftTableViewModel *> *array) {
   
        self.dataArray = array;
        
    } error:^{
        
        NSLog(@"获取失败");
    }];
    
    
    
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        LBSuperLeftTableViewModel *model = self.dataArray[indexPath.row];
        
        cell.textLabel.text = model.name;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
    } else {
        
        LBRightTableViewCell *cell = [LBRightTableViewCell cellWithTableView:tableView];
        
        cell.model = self.rightDataArray[indexPath.row];
        cell.cellDelegate = self;
        cell.numLabel.text = [NSString stringWithFormat:@"%zd",self.num];
        return cell;
        
    }

    
}
-(void)click:(UIButton *)button{
    if (button.tag==1001) {
        self.num ++;

    }else if(self.num>0){
        self.num--;
    }
   
    [self.rightTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (tableView == self.leftTableView) {
        
        [LBSuperLeftTableViewModel productWithID:self.dataArray[indexPath.row].id success:^(NSArray<LBSuperLeftTableViewModel *> *array) {
            
            self.rightDataArray = array;
            
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


@end
