//
//  LBMeTableViewController.m
//  LoveBee
//
//  Created by hou_qingwei on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBMeTableViewController.h"
#import <Masonry.h>
#import "LBgoodsViewController.h"
#import "LBMeCell.h"
#import "LBMeTwoCell.h"
#import "LBThreeCell.h"
#import "LBMeFourCell.h"
#import "LBMeorderViewController.h"

@interface LBMeTableViewController ()
@property (strong, readwrite, nonatomic) UITableView *tableView;
@end

@implementation LBMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIView *TopView = [[UIView alloc]init];
    [self.view addSubview:TopView];
    TopView.backgroundColor = [UIColor redColor];
    TopView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/3);
    
    [TopView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_my_avatar_bg"]]];
   //button下面的view
    UIView *buttonView = [[UIView alloc]init];
    buttonView.frame = CGRectMake(0, TopView.bounds.size.height/5*4, self.view.bounds.size.width,TopView.bounds.size.height/5);
   // buttonView.backgroundColor = [UIColor orangeColor];
    buttonView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_coupon_verify_normal"]];
    [TopView addSubview:buttonView];
   //leftbutton左边按钮
    UIButton *leftButton = [[UIButton alloc]init];
    [leftButton setTitle:@"商品收藏" forState:UIControlStateNormal];
   // [leftButton setImage:@"" forState:<#(UIControlState)#>
    [leftButton setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_normal"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchDown];
    [buttonView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonView.mas_top).offset(0);
        make.bottom.equalTo(buttonView.mas_bottom).offset(0);
        make.left.equalTo(buttonView.mas_left).offset(0);
        make.width.mas_equalTo(self.view.bounds.size.width/2);
    }];
    //右边按扭
    UIButton *rightButton = [[UIButton alloc]init];
  
    [rightButton setTitle:@"店铺收藏" forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_normal"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButton) forControlEvents:UIControlEventTouchDown];

    
    [buttonView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonView.mas_top).offset(0);
        make.bottom.equalTo(buttonView.mas_bottom).offset(0);
        make.left.equalTo(buttonView.mas_left).offset(self.view.bounds.size.width/2);
        make.width.mas_equalTo(self.view.bounds.size.width/2);
    }];
    //头像
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"v2_my_avatar"];
    
    [TopView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(TopView.mas_centerY).offset(0);
        make.left.equalTo(TopView.mas_left).offset(20);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    //注册会员
    UIButton *memberButton = [[UIButton alloc]init];
//    memberButton.backgroundColor = [UIColor redColor];
    [TopView addSubview:memberButton];
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(20);
        make.centerY.equalTo(TopView.mas_centerY).offset(0);
        make.height.mas_equalTo(70);
        make.right.equalTo(TopView.mas_right).offset(0);
        
    }];
    //电话号码
    UILabel *phoneNumber = [[UILabel alloc]init];
    phoneNumber.backgroundColor = [UIColor greenColor];
    [memberButton addSubview:phoneNumber];
    [phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(memberButton.mas_left).offset(0);
        make.top.equalTo(memberButton.mas_top).offset(0);
        make.right.equalTo(memberButton.mas_right).offset(0);
        make.height.mas_equalTo(20);
    }];
    //向右箭头
    UIImageView *leftImageView = [[UIImageView alloc]init];
    leftImageView.image = [UIImage imageNamed:@"homepage_knownbtn"];
    [TopView addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(memberButton.mas_top).offset(0);
        make.bottom.equalTo(memberButton.mas_bottom).offset(0);
        make.right.equalTo(memberButton.mas_right).offset(0);
        make.width.mas_equalTo(20);
    }];
    //注册会员图标
    UIImageView *IImageView = [[UIImageView alloc]init];
    IImageView.image = [UIImage imageNamed:@"icon_member"];
    [memberButton addSubview:IImageView];
    [IImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(memberButton.mas_left).offset(0);
        make.bottom.equalTo(memberButton.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(90);
    }];
    UILabel *IImageLabel = [[UILabel alloc]init];
    [IImageView addSubview:IImageLabel];
    IImageLabel.text = @"注册会员";
    IImageLabel.textColor = [UIColor redColor];
    IImageLabel.font = [UIFont systemFontOfSize:12];
    [IImageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(IImageView.mas_right).offset(0);
        make.top.equalTo(IImageView.mas_top).offset(0);
        make.bottom.equalTo(IImageView.mas_bottom).offset(0);
        make.width.mas_equalTo(60);
    }];
//    UILabel *IImageView = [[UILabel alloc]init];
//    [IImageView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_member"]]];
//    [IImageView sizeToFit]; //自动调整大小
//
//IImageView.text = @"注册会员";
//    IImageView.textAlignment = YES;
//    [memberButton addSubview:IImageView];
//    [IImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(memberButton.mas_left).offset(0);
//        make.bottom.equalTo(memberButton.mas_bottom).offset(0);
//        make.height.mas_equalTo(30);
//        make.width.mas_equalTo(90);
//    }];
    
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/3, self.view.frame.size.width, (self.view.frame.size.height - self.view.bounds.size.height/3)) style:UITableViewStylePlain];
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.tableFooterView = [[UIView alloc] init];
//        tableView.rowHeight = 60;
        //滑动
        //        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:_tableView];
   
}
-(void)rightButton{
    //1.设置self.tabBarController.tabBar.hidden=YES;
    
    self.tabBarController.tabBar.hidden=YES;
    
    //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
    
    self.hidesBottomBarWhenPushed=YES;
    LBgoodsViewController *next=[[LBgoodsViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    next.navigationItem.title = @"店铺收藏";
    
    //并在push后设置self.hidesBottomBarWhenPushed=NO;
    //这样back回来的时候，tabBar会恢复正常显示。

}
-(void)leftButton{

    //1.设置self.tabBarController.tabBar.hidden=YES;
    
    self.tabBarController.tabBar.hidden=YES;
    
    //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
    
    self.hidesBottomBarWhenPushed=YES;
    LBgoodsViewController *next=[[LBgoodsViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    next.navigationItem.title = @"商品收藏";

    //并在push后设置self.hidesBottomBarWhenPushed=NO;
    //这样back回来的时候，tabBar会恢复正常显示。
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;//section头部高度
}
//底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{  if(section == 3){
    return 40;
}
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    if (section == 3) {
        return 1;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 ) {
        if (indexPath.row == 0) {
            LBMeCell *cell = [LBMeCell cellWithTableView:tableView];
            cell.leftLabel.text = @"我的订单";
            cell.rightLabel.text = @"查看全部订单";
            tableView.rowHeight = 30;
            return cell;
        }else if (indexPath.row == 1){
            
            LBMeTwoCell *cell = [LBMeTwoCell cellWithTableView:tableView];
            tableView.rowHeight = 92;
            cell.payImage.image = [UIImage imageNamed:@"icon_daifukuan"];
            cell.paylabel.text = @"待付款";
            cell.paylabel.font =[UIFont systemFontOfSize:13];
            cell.paylabel.textAlignment = YES;
            [cell.payButton addTarget:self action:@selector(payButton) forControlEvents:UIControlEventTouchDown];
            cell.button2image.image = [UIImage imageNamed:@"icon_daishouhuo"];
            cell.button2label.text= @"待收货";
            cell.button2label.font =[UIFont systemFontOfSize:13];
            cell.button2label.textAlignment = YES;
            cell.button3image.image = [UIImage imageNamed:@"icon_daipingjia"];
            cell.button3label.text = @"待评价";
            cell.button3label.font =[UIFont systemFontOfSize:13];
            cell.button3label.textAlignment = YES;
            cell.button4image.image = [UIImage imageNamed:@"icon_tuikuan"];
            cell.button4label.text = @"退款/售后";
            cell.button4label.font =[UIFont systemFontOfSize:13];
            cell.button4label.textAlignment = YES;
            //cell不可被点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
      
    }
    if (indexPath.section == 1 ) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            }
            //cell不可被点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.rowHeight = 30;

            cell.textLabel.text = @"我的钱包";
            return cell;
        }else if (indexPath.row == 1){
            
            LBThreeCell *cell = [LBThreeCell cellWithTableView:tableView];
            tableView.rowHeight = 92;
            //cell不可被点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
        
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            LBMeTwoCell *cell = [LBMeTwoCell cellWithTableView:tableView];
            tableView.rowHeight = 92;
            cell.payImage.image = [UIImage imageNamed:@"Integral-mall"];
            cell.paylabel.text = @"积分商城";
            cell.paylabel.font =[UIFont systemFontOfSize:13];
            cell.paylabel.textAlignment = YES;

            cell.button2image.image = [UIImage imageNamed:@"v2_my_address_icon"];
            cell.button2label.text= @"收货地址";
            cell.button2label.font =[UIFont systemFontOfSize:13];
            cell.button2label.textAlignment = YES;

            cell.button3image.image = [UIImage imageNamed:@"icon_message"];
            cell.button3label.text = @"我的消息";
            cell.button3label.font =[UIFont systemFontOfSize:13];
            cell.button3label.textAlignment = YES;

            cell.button4image.image = [UIImage imageNamed:@"v2_my_feedback_icon-1"];
            cell.button4label.text = @"客服/反馈";
            cell.button4label.font =[UIFont systemFontOfSize:13];
            cell.button4label.textAlignment = YES;
            //cell不可被点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }else if (indexPath.row == 1){
            LBMeTwoCell *cell = [LBMeTwoCell cellWithTableView:tableView];
            tableView.rowHeight = 92;
            cell.payImage.image = [UIImage imageNamed:@"v2_my_cooperate"];
            cell.paylabel.text = @"加盟合作";
            cell.paylabel.font =[UIFont systemFontOfSize:13];
            cell.paylabel.textAlignment = YES;
            
            cell.button2image.image = [UIImage imageNamed:@"v2_my_profitback"];
            cell.button2label.text= @"邀请反复";
            cell.button2label.font =[UIFont systemFontOfSize:13];
            cell.button2label.textAlignment = YES;
            //cell不可被点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
    }
    if (indexPath.section == 3) {
        LBMeFourCell *cell = [LBMeFourCell cellWithTableView:tableView];
       // [cell.imageButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    tableView.rowHeight = 50;

    // Configure the cell...
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
-(void)payButton{
    LBMeorderViewController *Meorder =[LBMeorderViewController new];

    //1.设置self.tabBarController.tabBar.hidden=YES;
    
    self.tabBarController.tabBar.hidden=YES;
    
    //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
    
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:Meorder animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    Meorder.navigationItem.title = @"商品收藏";
    
    //并在push后设置self.hidesBottomBarWhenPushed=NO;
    //这样back回来的时候，tabBar会恢复正常显示。

//    Meorder.title = @"我的订单";
//    [self.navigationController pushViewController:Meorder animated:YES];
    
}
-(void) viewWillAppear:(BOOL)animated{
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
