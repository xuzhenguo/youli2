//
//  DownLoadData.m
//  007AFN的使用
//
//  Created by   on 15/5/18.
//  Copyright (c) 2015年  All rights reserved.
//

#import "DownLoadData.h"
#import "AFAppDotNetAPIClient.h"
#import "TitleModel.h"
#import "PlaceMadel.h"
#import "TitleModel.h"
#import  "tripModel.h"
#import  "BagModel.h"
#import "downModel.h"
#import "collectModel.h"
#import "LocalityModel.h"
@implementation DownLoadData


//获取推荐模块数据
+ (NSURLSessionDataTask *)getRecommendPageData:(void (^) (id obj1,id obj2,id obj3, NSError *err))block withPage:(int)page
{
    
    
    return [[AFAppDotNetAPIClient sharedClient]GET:kMAinPageUrlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        

        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:responseObject forKey:@"Recommend"];
        [user synchronize];
        
        NSDictionary  *json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
//      广告栏
        NSDictionary *slideDic = [json objectForKey:@"data"];
        NSArray *slideArr = [slideDic objectForKey:@"slide"];
        NSMutableArray *slideMutableAll = [[NSMutableArray alloc]init];
        [slideArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            TitleModel *title = [TitleModel appDic:obj];
            [slideMutableAll addObject:title];
        }];
        
//        穷游
        NSArray *placeArr = [slideDic objectForKey:@"place"];
        NSMutableArray *placeMutableAll = [[NSMutableArray alloc]init];
        [placeArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            PlaceMadel *Place = [PlaceMadel appWithDic:obj];
            [placeMutableAll addObject:Place];
        }];
        
//       笔记
        NSArray *tripArr = [slideDic objectForKey:@"trip"];
        NSMutableArray *tripMutableAll = [[NSMutableArray alloc]init];
        [tripArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
           tripModel *Place = [tripModel appWithDic:obj];
            [tripMutableAll addObject:Place];
        }];

        if (block) {
            block(slideMutableAll,placeMutableAll,tripMutableAll,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil,nil,nil,error);
        }
    }];
    
    return nil;

}

+ (NSURLSessionDataTask *)getcivilPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page
{
    
     NSDictionary *parameters = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"v":@"1",@"track_deviceid":@"864312020164434",@"track_app_version":@"5.2.1",@"track_app_channel":@"360m",@"track_device_info":@"HM2013022",@"track_os":@"Android4.2.1",@"track_user_id":@"",@"app_installtime":@"1411107832476",@"type":@"country",@"objectid":page,};
    
    
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"http://open.qyer.com/guide/guide/get_guide_list" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        
        NSUserDefaults *urser = [NSUserDefaults standardUserDefaults];
        
        [urser setObject:responseObject forKey:page];
        [urser synchronize];
        
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *jsonArr = [json objectForKey:@"data"];
        
        NSMutableArray *dataArr = [[NSMutableArray alloc]init];
        [jsonArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            BagModel *bigModel = [BagModel appWithDic:obj];
            [dataArr addObject:bigModel];
        }];
        if (block) {
            block(dataArr,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
    
    
}
//获取国内锦囊数据详情页
+ (NSURLSessionDataTask *)getcivilDetailData:(void (^) (id obj,id obj1, NSError *err))block withId:(NSString *)myId
{
    NSString *path = @"http://open.qyer.com/guide/guide/get_guide_info?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=864312020164434&track_device_info=HM2013022&app_installtime=1411107832476&guideid=%@";
    NSString *pathUrl = [NSString stringWithFormat:path,myId];
    
    return [[AFAppDotNetAPIClient sharedClient]GET:pathUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        

        
//        NSData *data = [user objectForKey:@"data"];
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *jsonData = [jsonDic objectForKey:@"data"];
        
        //        下载模型
        NSDictionary *downJson = [jsonData objectForKey:@"mobile_guide"];
        downModel *doModel = [downModel appWithDic:downJson];
        
        
        
        
        
//        NSMutableArray *dataArr = [[NSMutableArray alloc]init];
        
            
        BagModel *bagModel = [BagModel appWithDic:jsonData];
        
        //        存储数据
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:responseObject forKey:myId];
        [user synchronize];
    
        
        if (block) {
            block(bagModel,doModel,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil,nil,error);
        }
    }];

    return nil;
}

//获取国国家锦囊列表
+ (NSURLSessionDataTask *)getCountriesDetailData:(void (^) (id obj,id obj1, NSError *err))block withId:(NSString *)myId
{
    
   NSString *path = @"http://open.qyer.com/place/common/get_all_country?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1";
    
  return   [[AFAppDotNetAPIClient sharedClient] POST:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
      
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
      [user setObject:responseObject forKey:@"myId"];
      
    
    
      NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
      
      NSArray *jsonData2 = [jsonData objectForKey:@"data"];
      

      NSMutableArray *dataBigArr = [[NSMutableArray alloc]init];
      
      [jsonData2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          
        NSMutableArray *dataSmallArr = [[NSMutableArray alloc]init];
          NSArray *jsonArr = [obj objectForKey:@"hotcountrylist"];
          
          [jsonArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
              
              collectModel *model = [collectModel appWithDic:obj];
              [dataSmallArr addObject:model];
          }];
         
          [dataBigArr addObject:dataSmallArr];
      }];
      
      if (block) {
          block(dataBigArr,nil,nil);
      }
      
      
      
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
      if (block) {
          block(nil,nil,error);
      }
      
  }];
    
    
}


//获取游记列表
+ (NSURLSessionDataTask *)getTravelPageData:(void (^) (id obj1,id obj2,id obj3, NSError *err))block withPage:(int)page
{
    NSString *path = @"http://open.qyer.com/qyer/recommands/trip?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&type=index&page=%d&count=20";
    NSString *pathUrl = [NSString stringWithFormat:path,page];
    
    return [[AFAppDotNetAPIClient sharedClient]POST:pathUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
     
        NSDictionary *jason = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [jason objectForKey:@"data"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]init];
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            LocalityModel *model = [LocalityModel appWithDic:obj];
            
            [dataArr addObject:model];
            
        }];
        
        if (block) {
            block(dataArr,nil,nil,nil);
        }
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            
            block(nil,nil,nil,error);
        }
        
    }];
    
}

@end









