//
//  LocationViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor grayColor];
    if (indexPath.row == 0) {
        cell.textLabel.text = self.dataStr.name;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    if (indexPath.row == 1) {
        NSString *site = [NSString stringWithFormat:@"地址 :   %@",self.dataStr.address];
        cell.textLabel.text = site;
    }
    if (indexPath.row == 2) {
        NSString *site = [NSString stringWithFormat:@"所在类别 : %@",self.dataStr.type];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = site;
    }
    if (indexPath.row == 3) {
        NSString *site = [NSString stringWithFormat:@"详细介绍 : 距离你当前的距离%ld米",self.dataStr.distance];
        cell.textLabel.text = site;
    }
    if (indexPath.row == 4) {
        if (self.dataStr.tel) {
            NSString *site = [NSString stringWithFormat:@"电话 : %@",self.dataStr.tel];
            cell.textLabel.text = site;
        }else
        {
            cell.textLabel.text = @"电话 : ";
        }
        
    }
    
    
    return cell;
}

@end
