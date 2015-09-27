//
//  FootDetailsViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootDetailsViewController.h"
#import "FoodDetailsModel.h"
#import "FootDetailsTableViewCell1.h"
#import "FootDetailsTableViewCell2.h"
#import "UIScrollView+PullScale.h"
#import "UILabel+Help.h"
@interface FootDetailsViewController ()
{
    NSMutableArray *dataArr;
}

@end

@implementation FootDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.table addPullScaleFuncInVC:self imgName:nil imgUrl:self.model.photo originalHeight:150 headURl:self.model.avatar name:self.model.username hasNavBar:(self.navigationController!=nil)];
    
    
    [self gataData];
    
    [self.HUD show:YES];
    [self.view addSubview:self.HUD];
    
}

-(void)gataData
{
    
    [DownLoadData getFoodDetailsPageData:^(id obj, NSError *err) {
        
        if (obj) {
            [self.HUD hide:YES];
            dataArr = obj;
            [self.table reloadData];
        }
    } withPage:self.model.myId];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSString *string = @"MYID";
        FootDetailsTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"FootDetailsTableViewCell1" bundle:nil] forCellReuseIdentifier:string];
            cell = [tableView dequeueReusableCellWithIdentifier:string];
        }
//        [cell updata:nil];
        cell.titleLbale.text = self.model.title;

        cell.contentLabel.text = self.model.myDescription;
        [cell.contentLabel AdjustCellHight];
        CGRect frame = cell.frame;
        frame.size.height = cell.contentLabel.frame.size.height +50;
        cell.frame = frame;
        
        return cell;
    }
    NSString *string = @"MYID2";
    FootDetailsTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"FootDetailsTableViewCell2" bundle:nil] forCellReuseIdentifier:string];
        cell = [tableView dequeueReusableCellWithIdentifier:string];
    }
    
    if (dataArr.count > 0) {
        FoodDetailsModel *model = dataArr[indexPath.row -1 ];
        cell.contentLabel.text = model.myDescription;
        
        NSString *path = model.photo;
        NSURL *url = [NSURL URLWithString:path];
        [cell.myImageview sd_setImageWithURL:url];
        
        cell.nameLbale.text = model.firstname;
        NSString *str = [NSString stringWithFormat:@"%@ : %@",model.countryname,model.cityname];
        cell.toponymyLable.text = str;
        
        [cell.contentLabel AdjustCellHight];
        CGRect frame = cell.frame;
        frame.size.height = cell.contentLabel.frame.size.height +180;
        cell.frame = frame;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if (indexPath.row == 0) {
        FootDetailsTableViewCell1 *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        
        return cell.frame.size.height;
//    }
//    return 180;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count + 1;
}

@end
