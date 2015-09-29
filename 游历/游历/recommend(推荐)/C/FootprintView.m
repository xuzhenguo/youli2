//
//  FootprintView.m
//  游历
//
//  Created by MAC—IOS on 15/9/27.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootprintView.h"
#import "RDVTabBarController.h"
#import "CollectCell.h"
#import "MainWebView.h"
@interface FootprintView ()
{
    NSMutableArray *dataArr;
}

@end

@implementation FootprintView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    dataArr = [user objectForKey:@"urlAll"];
    
    [self.table reloadData];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"MYID";
    CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CollectCell" bundle:nil] forCellReuseIdentifier:string];
        cell = [tableView dequeueReusableCellWithIdentifier:string];
    }
    
    if (dataArr.count > 0) {
        NSArray *arr = dataArr[indexPath.row];
        
        NSURL *url = [NSURL URLWithString:arr[2]];
        [cell.myImage sd_setImageWithURL:url];
        cell.myLable.text = arr[1];
    }
   
    
    [cell setBlock:^{
        NSLog(@"%ld",indexPath.row);
        
        
        NSMutableArray *dataMuArr = [[NSMutableArray alloc]initWithArray:dataArr];
        [dataMuArr removeObjectAtIndex:indexPath.row];
        NSUserDefaults *urser = [NSUserDefaults standardUserDefaults];
        [urser setObject:dataMuArr forKey:@"urlAll"];
        dataArr = dataMuArr;
        [urser synchronize];
        [self.table reloadData];
    }];
    if (dataArr.count == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = @"收藏为空";
        cell.textLabel.textColor = [UIColor grayColor];
        
        return cell;
    }
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (dataArr.count == 0) {
        return 1;
    }
    
    return dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (dataArr.count == 0) {
        return;
    }
    MainWebView *web = [[MainWebView alloc]init];
    web.path = dataArr[indexPath.row][0];
    [self.navigationController pushViewController:web animated:YES];
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



@end
