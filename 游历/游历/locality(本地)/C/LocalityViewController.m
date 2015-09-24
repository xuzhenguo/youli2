//
//  LocalityViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "LocalityViewController.h"
#import "LocalityTableViewCell.h"
#import "LocalityModel.h"
#import "MainWebView.h"
@interface LocalityViewController ()
{
    NSMutableArray *dataArr;
}

@end

@implementation LocalityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"本地";
    [self gateData];
    
    
    
    
}

-(void)gateData
{
    [DownLoadData getTravelPageData:^(id obj1, id obj2, id obj3, NSError *err) {
        if (obj1) {
            
            dataArr = obj1;
            [self.table reloadData];
        }else
        {
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"网络不佳请你下拉重试   " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
        
        
    } withPage:1];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"MYID";
    LocalityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
       if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"LocalityTableViewCell" bundle:nil] forCellReuseIdentifier:string];
        cell = [tableView dequeueReusableCellWithIdentifier:string];
    }
    LocalityModel *model = dataArr[indexPath.row];
    [cell updataCell:model];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocalityModel *model = dataArr[indexPath.row];
    MainWebView *web = [[MainWebView alloc]init];
    web.path = model.view_author_url;
    [self.navigationController pushViewController:web animated:YES];
    
    
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
