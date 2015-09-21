//
//  BagDetailViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "BagDetailViewController.h"
#import "BagModel.h"
#import "UIScrollView+PullScale.h"
#import "RDVTabBarController.h"
#import "AuthorCell.h"
#import "BagCell.h"
#import "UILabel+Help.h"
#import "TitleImageTableViewCell.h"
#import "DownCell.h"
#import "downModel.h"
#import "DownLoadData.h"
#import "DownData.h"

@implementation BagDetailViewController
{
    NSMutableArray *otherData;
    BagModel *dataMode;
    UISegmentedControl * segment;
    AuthorCell *cellAuthor;
    NSMutableArray *dataArr;
    NSArray *otherId;
    downModel *dwnModel;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    segment = [[UISegmentedControl alloc]initWithItems:@[@"关于锦囊",@"相关锦囊",@"下载"]];
    segment.frame = CGRectMake((SCREEN_WIDHT-300)/2, 7, 300, 30);
    segment.tintColor = [UIColor grayColor];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(pressSegment:) forControlEvents:UIControlEventValueChanged];
    otherData = [[NSMutableArray alloc]init];
    [self getData:self.guide_id];
}
-(void)getData:(NSString *)myId
{
    
#pragma mark --数据持久
    //    本地提取数据
    //        存储数据
    if (_guide_id == myId) {
        //    if (self.name != nil) {
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        
        NSData *data = [user objectForKey:self.guide_id];
        if (data != nil) {
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *jsonData = [jsonDic objectForKey:@"data"];
            
            dataMode = [BagModel appWithDic:jsonData];
            [self.table reloadData];
        }
        
    }
    //     }
    
    dataArr = [[NSMutableArray alloc]init];
    [DownLoadData getcivilDetailData:^(id obj,id obj1, NSError *err) {
        if(obj) {
            
            if (_guide_id == myId) {
                dataMode = obj;
                dwnModel = obj1;
            }else{
                
                //            其他页数据
                [dataArr addObject:obj];
                
            }
            [self.table reloadData];
        }else{
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"网络不佳请你下拉重试   " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    } withId:myId];
}
#pragma mark --返回Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *ID = @"ID";
        TitleImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[TitleImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        [cell upData:dataMode];
        
        
        return cell;
    }else{
        
        if (_integer == 0) {
            NSString *ID2 = @"ID2";
            AuthorCell *cell = [tableView dequeueReusableCellWithIdentifier:ID2];
            
            if (cell == nil) {
                cell = [[AuthorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID2];
            }
            
            if (indexPath.row == 0) {
#pragma mark -- 作者1
                NSString *path =[NSString stringWithFormat:@"%@/260_390.jpg?%@",dataMode.cover,dataMode.cover_updatetime];
                NSURL *url = [NSURL URLWithString:path];
                [cell.imageView2 sd_setImageWithURL:url];
                cell.nameLable1.text = @"锦囊作者";
                NSString *conten = [NSString stringWithFormat:@"         %@",dataMode.briefinfo];
                
                cell.contentLabel.text = conten;
                
                [cell.contentLabel AdjustCellHight];
                
                CGRect frame = cell.frame;
                frame.size.height = cell.contentLabel.frame.size.height +90;
                cell.frame = frame;
                
                
                return cell;
            }
            if (indexPath.row == 1) {
                
#pragma mark -- 作者2
                NSString *path = dataMode.author_icon;
                NSURL *url = [NSURL URLWithString:path];
                [cell.imageView2 sd_setImageWithURL:url];
                cell.nameLable1.text = dataMode.author_name;
                
                NSString *conten = [NSString stringWithFormat:@"        %@",dataMode.author_intro];
                cell.contentLabel.text = conten;
                
                
                [cell.contentLabel AdjustCellHight];
                CGRect frame = cell.frame;
                frame.size.height = cell.contentLabel.frame.size.height +90;
                cell.frame = frame;
                
                
                return cell;
                
            }
            
        }
        
        
        if (_integer == 1) {
            
            static NSString *ID10 = @"ID10";
            BagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID10];
            if (cell == nil) {
                cell = [[BagCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID10];
            }
            BagModel *bagModel = otherData[indexPath.row];
            [cell updata:bagModel];
            
            return cell;
            
        }
        
#pragma mark -- 下载事件
        if (_integer == 2) {
            static NSString *ID11 = @"ID11";
            DownCell *cell = [tableView dequeueReusableCellWithIdentifier:ID11];
            if (cell == nil) {
                cell = [[DownCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID11];
            }
            //            按钮点击事件
            [cell setBlock:^{
                
                //                下载
                //                NSString *path = dataMode.fileUrl;
                
                //                [NSURLConnection connectionWithRequest:request delegate:self];
                
                DownData *fd = [[DownData alloc]init];
                fd.model  = dwnModel;
                [fd requestFromUrlreceiveDataBlock:^(DownData *fd) {
                    CGFloat progress = [fd.model.downloadSize longLongValue]/1.0f/[fd.model.size longLongValue];
                    cell.planLbel.text = [NSString stringWithFormat:@"%.2f%@",progress*100,@"%"];
                    cell.progressView.progress = progress;
                } finished:^(DownData *fd) {
                    
                    NSLog(@"文件下载完成，地址：%@",fd.localPath);
                    
                    //解压zip
                
                    
                    
                    
                    
                    
                    
                } failed:^(DownData *fd) {
                    
                }];
                
                
                
            }];
            [cell upData:dataMode];
            return cell;
            
        }
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}
#pragma mark -- 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150;
    }
    
    if (_integer == 0) {
        AuthorCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
    if (_integer == 1) {
        return 100;
    }else
    {
        DownCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 60;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==1) {
        UIView *view = [[UIView alloc]init];
        
        [view addSubview:segment];
        return view;
    }
    
    return nil;
}
#pragma mark -- 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (self.integer == 0) {
        return 2;
    }
    if (self.integer == 1) {
        return otherData.count;
    }else
    {
        return 1;
    }
}
#pragma mark -- 分段控件点击事件
-(void)pressSegment:(id)per
{
    UISegmentedControl *sengent = (UISegmentedControl *)per;
    
    self.integer = sengent.selectedSegmentIndex;
    
    if (sengent.selectedSegmentIndex == 1) {
        otherId = [dataMode.other_guide_ids componentsSeparatedByString:@","];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [otherId enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            
            NSData *data = [user objectForKey:otherId[idx]];
            if (data != nil) {
                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSDictionary *jsonData = [jsonDic objectForKey:@"data"];
                
                BagModel *model = [BagModel appWithDic:jsonData];
                [arr addObject:model];
            }
            
            
        }];
        
        otherData = arr;
        [self.table reloadData];
        
        [otherId enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [self getData:otherId[idx]];
            if (idx == otherId.count) {
                otherData = dataArr;
            }
        }];
        
    }
    [self.table reloadData];
    
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_integer == 1) {
        BagDetailViewController *bagDetail = [[BagDetailViewController alloc]init];
        bagDetail.guide_id = otherId[indexPath.row];
        //        bagDetail.name = bagModel.guide_cnname;
        [self.navigationController pushViewController:bagDetail animated:YES];
    }
    
    
    
}


@end
