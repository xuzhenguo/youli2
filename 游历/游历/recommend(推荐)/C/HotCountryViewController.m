//
//  HotCountryViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "HotCountryViewController.h"
#import "HotCountryCell.h"
#import "collectModel.h"
#import "BagViewController.h"
@interface HotCountryViewController ()
{
    NSMutableArray *dataArr;
}

@end

@implementation HotCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.HUD show:YES];
    [self.view addSubview:self.HUD];
    
    [self gataData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

-(void)gataData
{
    


    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"myId"];
    
    if (data != nil) {
        
        [self.HUD hide:YES];
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *jsonData2 = [jsonData objectForKey:@"data"];
        
        
        NSMutableArray *dataBig = [[NSMutableArray alloc]init];
        
        
        [jsonData2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSMutableArray *dataSmallArr = [[NSMutableArray alloc]init];
            NSArray *jsonArr = [obj objectForKey:@"hotcountrylist"];
            
            [jsonArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                collectModel *model = [collectModel appWithDic:obj];
                [dataSmallArr addObject:model];
            }];
            
            [dataBig addObject:dataSmallArr];
        
        }];
        
        dataArr = dataBig[0];
        [self.table reloadData];
    }
    
    
    
    
    
    
    
    
    
    [DownLoadData getCountriesDetailData:^(id obj, id obj1, NSError *err) {
        if (obj) {
        
             [self.HUD hide:YES];
            dataArr = obj[0];
            
            [self.table reloadData];
        }else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"数据下载失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
     
            
     
        
    } withId:nil];
    

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"MYID";
    HotCountryCell  *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"HotCountryCell" bundle:nil] forCellReuseIdentifier:string];
        cell = [tableView dequeueReusableCellWithIdentifier:string];
    }
    
    if (dataArr.count > 0 ) {
        collectModel *model = dataArr[indexPath.row];
        
        NSString *path = model.photo;
        NSURL *url = [NSURL URLWithString:path];
        [cell.imageV sd_setImageWithURL:url];
        
        cell.countryLbale.text = model.catename;
        NSLog(@"%@",cell.countryLbale.text);
        cell.EnglishLabel.text = model.catename_en;
        NSLog(@"%@",cell.EnglishLabel.text);
        
        NSString *siteStr = [NSString stringWithFormat:@"%@:个%@",model.count,model.label];
        cell.cityLable.text = siteStr;
        
    }

    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    collectModel *model1 = dataArr[indexPath.row];

    
    BagViewController *bagView = [[BagViewController alloc]init];
    NSString *myId = [NSString stringWithFormat:@"%d",model1.pid];
    
    bagView.myId = myId;
    [self.navigationController pushViewController:bagView animated:YES];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}

@end
