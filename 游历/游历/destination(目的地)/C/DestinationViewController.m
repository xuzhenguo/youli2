//
//  DestinationViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()<UISearchBarDelegate>

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"目的地";
    
    
    // Do any additional setup after loading the view.
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor redColor];
       searchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    NSLog(@"%@",searchBar.text);
   
    return searchBar;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}



#pragma mark - 键盘点击事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
}

@end
