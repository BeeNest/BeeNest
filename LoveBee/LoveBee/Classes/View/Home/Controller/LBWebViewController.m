//
//  LBWebViewController.m
//  LoveBee
//
//  Created by Jiangergo Pk Czt on 16/9/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LBWebViewController.h"
#import <Masonry.h>

@interface LBWebViewController ()<UIWebViewDelegate>

/// 活动模型
@property (nonatomic, strong) LBHomeActivitieModel *model;

/// 显示网页的View
@property (nonatomic, strong) UIWebView *webView;

/// 加载进度条
@property (nonatomic, strong) UIView *progressView;

@end

@implementation LBWebViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (instancetype)initWithActivityModel:(LBHomeActivitieModel *)model{
    self = [super init];
    self.model = model;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化设置
    self.webView = [[UIWebView alloc]init];
    self.title = self.model.name;
    
    // 添加控件
    [self.view addSubview:self.webView];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // 添加约束
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    // 设置代理
    self.webView.delegate = self;
    
//    NSLog(@"url: %@",self.model.customURL);
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.customURL]]];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error: %@",error);
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
