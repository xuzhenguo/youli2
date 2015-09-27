//
//  RecommendViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "RecommendViewController.h"
#import "TitleModel.h"
#import "SDCycleScrollView.h"
#import "secondCell.h"
#import "fourCell.h"
#import "fiveCell.h"
#import "MainWebView.h"
#import "PlaceMadel.h"
#import "TitleModel.h"
#import "tripModel.h"
#import "BagViewController.h"
#import "FootViewController.h"
#import "HotCountryViewController.h"
#import "FootprintView.h"
@interface RecommendViewController ()<SDCycleScrollViewDelegate,MBProgressHUDDelegate>
{
//    标题图片数据
    NSMutableArray *titleImageArr;
//    
    NSMutableArray  *placeMutableAll;
    NSMutableArray *tripMutableAll;
}

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",NSHomeDirectory());
    self.navigationItem.title = @"推荐";
    
    self.Hnum = 49;

    [self.view addSubview:self.HUD];
    [self.HUD show:YES];
    
    
    
    __weak typeof(self) weakSelf = self;
    
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    [self.table addLegendHeaderWithRefreshingBlock:^{
        [weakSelf gataData];
    }];
    
    // 马上进入刷新状态
    [self.table.legendHeader beginRefreshing];
    
    [self gataData];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = left;
    

    
}

#pragma mark -- 标题图片数据请求
-(void)gataData
{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *jsonData = [user objectForKey:@"Recommend"];
    
    if (jsonData != nil) {
            NSDictionary  *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        //      广告栏
        NSDictionary *slideDic = [json objectForKey:@"data"];
        NSArray *slideArr = [slideDic objectForKey:@"slide"];
        NSMutableArray *slideMutableAll = [[NSMutableArray alloc]init];
        [slideArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            TitleModel *title = [TitleModel appDic:obj];
            [slideMutableAll addObject:title];
        }];
        titleImageArr = slideMutableAll;
        
        
        //        穷游
        NSArray *placeArr = [slideDic objectForKey:@"place"];
            NSMutableArray *placeMutableAll2 = [[NSMutableArray alloc]init];
        [placeArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            PlaceMadel *Place = [PlaceMadel appWithDic:obj];
            [placeMutableAll2 addObject:Place];
        }];
        placeMutableAll = placeMutableAll2;
        
        //       笔记
        NSArray *tripArr = [slideDic objectForKey:@"trip"];
            NSMutableArray *tripMutableAll2 = [[NSMutableArray alloc]init];
        [tripArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            tripModel *Place = [tripModel appWithDic:obj];
            [tripMutableAll2 addObject:Place];
        }];
        tripMutableAll = tripMutableAll2;
      [self.table reloadData];
    }

    
    [DownLoadData getRecommendPageData:^(id obj1, id obj2, id obj3, NSError *err) {
        if (obj1 && obj2 && obj3) {
            
            
            // 拿到当前的下拉刷新控件，结束刷新状态
            [self.table.header endRefreshing];
             [self.HUD hide:YES];
//            [self.table.footer endRefreshing];  //结束刷新
            
            titleImageArr = obj1;
            placeMutableAll = obj2;
            tripMutableAll = obj3;
            [self.table reloadData];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"数据下载失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
    } withPage:0];
}
#pragma mark -- 每列返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return [tripMutableAll count];
            break;
            
        default:
            break;
    }
    return 0;
}

#pragma mark -- 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
          if (indexPath.row == 0) {
                NSString *ID = @"ID0";
                secondCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                if (cell == nil) {
                    cell = [[secondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                }
              [cell setBlock:^(long ln) {
                  
                  if (ln == 1) {
                      BagViewController *bigView = [[BagViewController alloc]init];
                      bigView.myId = @"11";
                      bigView.hidesBottomBarWhenPushed = YES;
                      [self.navigationController pushViewController:bigView animated:YES];
                  }
                  
                  if (ln == 2) {
                      
                      HotCountryViewController *hot = [[HotCountryViewController alloc]init];
                      [self.navigationController pushViewController:hot animated:YES];
                      
                  }
                  
                  
                  if (ln == 3) {
                      FootViewController *foot = [[FootViewController alloc]init];
                      [self.navigationController pushViewController:foot animated:YES];
  
                  }
                  
                  if (ln == 4) {
                      FootprintView *footprin = [[FootprintView alloc]init];
                      [self.navigationController pushViewController:footprin animated:YES];
                  }
                
              }];
                return cell;
            }

            break;
         case 2:
            if (indexPath.row == 0) {
                NSString *ID = @"ID4";
                fourCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                if (cell == nil) {
                    cell = [[fourCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                }
//                NSLog(@"%@",placeMutableAll);
                [cell updataApp:placeMutableAll];
                [cell setBlck:^(int n) {
                    PlaceMadel *Place = placeMutableAll[n-5];
                    MainWebView *web = [[MainWebView alloc]init];
                    web.path = Place.url;
                    [self.navigationController pushViewController:web animated:YES];
                    
                    
                    
                }];
                return cell;
            }

            break;
        case 3:
            if (1) {
                NSString *ID = @"ID5";
                fiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                if (cell == nil) {
                    cell = [[fiveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                }
                tripModel *trip = tripMutableAll[indexPath.row];
                [cell upData:trip];
                return cell;
            }
            break;
          
        default:
            break;
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
    
}
#pragma mark -- 每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 110;
            break;
        case 2:
            return 250;
            break;
        case 3:
            return 90;
            break;
        default:
            break;
    }
    return 40;
}
    
#pragma  mark -- Section数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
#pragma mark -- section高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    switch (section) {
        case 0:
            return 150;
            break;

        default:
            break;
    }
    return 30;

}
#pragma mark -- section
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        NSMutableArray *urlImags= [[NSMutableArray alloc]init];
        for (TitleModel *tile in titleImageArr) {
            [urlImags addObject:tile.photo];
        }
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,SCREEN_WIDHT, 150) imageURLStringsGroup:urlImags];
        cycleScrollView.infiniteLoop = YES;
        cycleScrollView.delegate = self;
        cycleScrollView.dotColor = [UIColor blueColor];
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        
        return cycleScrollView;

    }
    if (section == 1) {
        UILabel *lable = [[UILabel alloc]init];
        lable.font = [UIFont boldSystemFontOfSize:16];
        lable.text = @"     你想去的必定不同";
        return lable;
    }
    if (section == 2) {
        UILabel *lable = [[UILabel alloc]init];
        lable.font = [UIFont boldSystemFontOfSize:16];
        lable.text = @"     穷游";
        return lable;
    }
    if (section == 3) {
        UILabel *lable = [[UILabel alloc]init];
        lable.font = [UIFont boldSystemFontOfSize:16];
        lable.text = @"     心水日记";
        return lable;
    }
       return nil;
}
#pragma mark -- 每行的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    switch (indexPath.section) {
        case 3:
            if (1) {
                tripModel *trip = tripMutableAll[indexPath.row];
                MainWebView *web = [[MainWebView alloc]init];
                web.path = trip.view_url;
                [self.navigationController pushViewController:web animated:YES];
            }
            
            break;
            
        default:
            break;
    }
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    TitleModel *model = titleImageArr[index];
    MainWebView *web = [[MainWebView alloc]init];
    web.path = model.url;
    [self.navigationController pushViewController:web animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --去掉黏贴性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat sectionHeaderHeight = 250; //section的高度
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        
    }
    
}
#pragma mark - 触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    if (titleImageArr!= nil && placeMutableAll != nil && tripMutableAll != nil) {
        [self.HUD hide:YES];
    }
    
}
@end
