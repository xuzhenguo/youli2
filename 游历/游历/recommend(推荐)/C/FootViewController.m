//
//  FootViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootViewController.h"
#import "FootModel.h"
#import "FootTableViewCell.h"
#import "FootDetailsViewController.h"

static int pag ;
@interface FootViewController ()
{
    NSMutableArray *dataArr;

}

@end

@implementation FootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.HUD show:YES];
    [self.view addSubview:self.HUD];
    
    [self gataData];
    
    [self.HUD show:YES];
    
    
    //    =========下拉刷新==========
    __weak typeof(self) weakSelf = self;
    // 添加传  统的上拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    [self.table addLegendFooterWithRefreshingBlock:^{
        [weakSelf gataData];
    }];
    dataArr = [[NSMutableArray alloc]init];
    pag = 1;
}

-(void)gataData
{
    
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *responseObject = [user objectForKey:@"FoodPage"];
    
    if (responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray *arr = [dic objectForKey:@"data"];
        
        NSMutableArray *footArr = [[NSMutableArray alloc]init];
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            FootModel *model = [FootModel  appWithDic:obj];
            
            [footArr addObject:model];
        }];
        
        dataArr = footArr;
        
        [self.table reloadData];
    }
   
    
    
    
    
    
    
    
    [DownLoadData getFoodPageData:^(id obj1, NSError *err) {
        
        if (obj1 != nil) {
            
            [self.HUD hide:YES];
            pag ++;
            [self.table.footer endRefreshing];
            
            [self.HUD hide:YES];
            [dataArr addObjectsFromArray:obj1];
            [self.table reloadData];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"数据下载失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
        
    } type:@"country" myid:@"11" count:@"10" withPage:pag];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *string = @"MYID1";
    FootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"FootTableViewCell" bundle:nil] forCellReuseIdentifier:string];
        cell = [tableView dequeueReusableCellWithIdentifier:string];
    }
    
    
    if (dataArr.count > 0) {
        FootModel *model = dataArr[indexPath.row];
        [cell upDataModel:model];
    }
  
    return cell;

    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FootTableViewCell  *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FootDetailsViewController *footDetails = [[FootDetailsViewController alloc]init];
    FootModel *model = [dataArr objectAtIndex:indexPath.row];
    
    footDetails.model = model;

    [self.navigationController pushViewController:footDetails animated:YES];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   
    return dataArr.count;
}


@end
