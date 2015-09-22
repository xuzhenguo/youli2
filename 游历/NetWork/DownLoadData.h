//
//  DownLoadData.h
//  007AFN的使用
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadData : NSObject



//获取推荐模块数据
+ (NSURLSessionDataTask *)getRecommendPageData:(void (^) (id obj1,id obj2,id obj3, NSError *err))block withPage:(int)page;


//获取国内锦囊数据
+ (NSURLSessionDataTask *)getcivilPageData:(void (^) (id obj, NSError *err))block withPage:(NSString *)page;

//获取国内锦囊数据详情页
+ (NSURLSessionDataTask *)getcivilDetailData:(void (^) (id obj,id obj1, NSError *err))block withId:(NSString *)myId;


//获取国国家锦囊列表
+ (NSURLSessionDataTask *)getCountriesDetailData:(void (^) (id obj,id obj1, NSError *err))block withId:(NSString *)myId;
@end















