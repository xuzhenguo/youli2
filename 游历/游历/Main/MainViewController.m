//
//  MainViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDHT, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    _table.showsHorizontalScrollIndicator = NO;
    _table.showsVerticalScrollIndicator = NO;
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_table];
    _dataArr = [[NSMutableArray alloc]init];
    
    
    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    _HUD.delegate = self;
    _HUD.labelText = @"Loading";
    
    
    
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
