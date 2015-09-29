//
//  BigViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "BagViewController.h"
#import "RDVTabBarController.h"
#import "BagModel.h"
#import "BagDetailViewController.h"
@implementation BagViewController
{
    NSMutableArray *dataArr;
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getData];
    
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDHT, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _table.showsHorizontalScrollIndicator = NO;
    _table.showsVerticalScrollIndicator = NO;
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_table];
    
    
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
-(void)getData
{
    
    NSUserDefaults *urser = [NSUserDefaults standardUserDefaults];
    NSData * data =[urser objectForKey:self.myId];

    

    if (data != nil) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *jsonArr = [json objectForKey:@"data"];
    
        NSMutableArray *dataJsonArr = [[NSMutableArray alloc]init];
        
        if ([jsonArr isKindOfClass:[NSArray class]]) {
            [jsonArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                BagModel *bigModel = [BagModel appWithDic:obj];
                [dataJsonArr addObject:bigModel];
            }];
        }

        dataArr = dataJsonArr;
        [_table reloadData];
    }
    
    
    [DownLoadData getcivilPageData:^(id obj, NSError *err) {
        
        if(obj) {
            
            dataArr = obj;
            
            if (dataArr.count == 0) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"没有找到旅游景点,谢谢!!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            }
            
            
            [_table reloadData];
            
        }else{
            
                        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"网络不佳请你下拉重试   " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alertView show];
        }

    } withPage:self.myId];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *ID = @"ID";
    BagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BagCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    BagModel *bagModel = dataArr[indexPath.row];
    
    [cell updata:bagModel];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BagModel *bagModel = dataArr[indexPath.row];
    BagDetailViewController *bagDetail = [[BagDetailViewController alloc]init];
    bagDetail.guide_id = bagModel.guide_id;
    bagDetail.name = bagModel.guide_cnname;
    [self.navigationController pushViewController:bagDetail animated:YES];
}
@end
