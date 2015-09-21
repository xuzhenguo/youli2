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
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDHT, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _table.showsHorizontalScrollIndicator = NO;
    _table.showsVerticalScrollIndicator = NO;
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_table];
    _dataArr = [[NSMutableArray alloc]init];
 
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
