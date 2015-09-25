//
//  DestinationViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "DestinationViewController.h"
#import "ButCellTableViewCell.h"
#import "SmallMapCell.h"
#import "ResultCell.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

#import <AMapSearchKit/AMapSearchAPI.h>
#import "LocationViewController.h"

static int rowHeight;
@interface DestinationViewController ()<UISearchBarDelegate>
{
    NSArray *_pois;
}
@end

@implementation DestinationViewController

- (void)viewDidLoad {
    
//    隐藏地图
    rowHeight = 0;
    
    [super viewDidLoad];
      self.navigationItem.title = @"目的地";
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(idStrNotification:) name:@"idStr" object:nil];

}



#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
        searchBar.delegate = self;
        searchBar.backgroundColor = [UIColor redColor];
        searchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        NSLog(@"%@",searchBar.text);
        return searchBar;
    }
    UILabel *label = [[UILabel alloc]init];
    label.text = @"  详细列表";
    label.textColor = [UIColor orangeColor];
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 220;
        }
        return rowHeight;
    }
    return 70;
}

#pragma mark 表格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        
//    通知
      [[NSNotificationCenter defaultCenter]postNotificationName:@"indexPath" object:indexPath];
    
    LocationViewController *location = [[LocationViewController alloc]init];
    AMapPOI *dataStr= _pois[indexPath.row];
    location.dataStr = dataStr;
    [self.navigationController pushViewController:location animated:YES];
}

}
#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSString *CEllIDA = @"CEllIDA";
        
        ButCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CEllIDA];
        if (cell == nil) {
            cell = [[ButCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CEllIDA];
        }
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
  
        NSString *CEllIDA = @"CEllIDA1";
        
        SmallMapCell *cell = [tableView dequeueReusableCellWithIdentifier:CEllIDA];
        if (cell == nil) {
            cell = [[SmallMapCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CEllIDA];
        }
        [cell setBlok:^(NSArray *arr) {
            _pois = arr;
            [self.table reloadData];
        }];
        
        return cell;
        
        
    }else
    {
    
        NSString *string = @"MYID";
        ResultCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"ResultCell" bundle:nil] forCellReuseIdentifier:string];
            cell = [tableView dequeueReusableCellWithIdentifier:string];
        }
        if (_pois.count > 0) {
                AMapPOI *dataStr= _pois[indexPath.row];
                cell.nameLable.text = dataStr.name;
                cell.siteLable.text = dataStr.address;
            NSString *dis = [NSString stringWithFormat:@"距离:%ld",dataStr.distance];
            cell.distanceLabel.text = dis;
            
        }
    



        
        return cell;
        
    }
    
    
    
//    UITableViewCell *cell = [[UITableViewCell alloc]init];
//    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return _pois.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
    
}




#pragma mark - Action
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

    NSLog(@"%@",searchBar.text);
 
  [[NSNotificationCenter defaultCenter]postNotificationName:@"idStr" object:searchBar.text];
}

-(void)idStrNotification:(NSNotification *)notif
{
    
    NSString *idStr = [notif object];
    if ([idStr isEqualToString:@"展开地图"]) {
        if (rowHeight == 220) {
            rowHeight = 0;
        }else{
            rowHeight = 220;
        }
        
        [self.table reloadData];
        
}
}
@end
