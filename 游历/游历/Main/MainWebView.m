//
//  MainWebView.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "MainWebView.h"
#import "RDVTabBarController.h"
@implementation MainWebView

static NSString *urlKey;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    url = [NSURL URLWithString:self.path];
    
    UIWebView *webView = [[UIWebView alloc]init];
    webView.delegate = self;
    webView.frame = self.view.frame;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    
    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    _HUD.delegate = self;
    _HUD.labelText = @"Loading";
    [self.HUD show:YES];
    [self.view addSubview:_HUD];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_webview_next.png"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pusPag:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = left;
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 44, 44);
    [btn2 setTitle:@"收藏" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    [btn2 addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.rightBarButtonItem = right;

}

-(void)pusPag:(id)btn
{
 

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)collect:(UIButton *)btn
{
    
    
[btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
   
    NSUserDefaults *urer = [NSUserDefaults standardUserDefaults];
    
    dataArr =  [urer objectForKey:@"urlAll"];
    
    if (dataArr ==  nil) {
        dataArr = [[NSMutableArray alloc]init];
    }
    
    if (urlKey != self.path) {
    
        NSMutableArray *dataArr1 = [NSMutableArray arrayWithArray:dataArr];
    
        NSMutableArray *smallArr = [[NSMutableArray alloc]init];
        [smallArr addObject:self.path];
        if (self.titleStr == nil) {
            [smallArr addObject:@"暂时无描述"];
        }else{
            [smallArr addObject:self.titleStr];
        }
        
        [smallArr addObject:self.imageUrl];
        
        [dataArr1 addObject:smallArr];
        [urer setObject:dataArr1 forKey:@"urlAll"];
        [urer synchronize];
    
    }
    
    urlKey = self.path;
    
    
}

#pragma mark -- 隐藏标签栏
- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.HUD hide:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.HUD hide:YES];
}



@end
