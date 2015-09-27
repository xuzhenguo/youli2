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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:self.path];
    
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
    [btn addTarget:self action:@selector(pusPag) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = left;
    
}

-(void)pusPag
{
    
    [self.navigationController popViewControllerAnimated:YES];
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
