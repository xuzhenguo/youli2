//
//  bagModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BagModel : NSObject<NSCoding>
@property (nonatomic,copy)NSString *category_id;
@property (nonatomic,copy)NSString *category_title;
@property (nonatomic,copy)NSString *country_id;
//国家
@property (nonatomic,copy)NSString *country_name_cn;
//@property (nonatomic,copy)NSString *country_name_en;
//@property (nonatomic,copy)NSString *country_name_py;
//图片名
@property (nonatomic,copy)NSString *cover;
//图片更新时间
@property (nonatomic,copy)NSString *cover_updatetime;
//下载次数
@property (nonatomic,copy)NSNumber *download;
//下载地址
@property (nonatomic,copy)NSString *file;

@property (nonatomic,copy)NSString *guide_cnname;
@property (nonatomic,copy)NSString *guide_enname;
@property (nonatomic,copy)NSString *guide_id;
//@property (nonatomic,copy)NSString *guide_pinyin;
@property (nonatomic,copy)NSNumber *size;
//@property (nonatomic,copy)NSString *type;
//@property (nonatomic,copy)NSString *update_log;
@property (nonatomic,copy)NSString *update_time;
@property (nonatomic,copy)NSString *author_icon;
@property (nonatomic,copy)NSString *author_id;
@property (nonatomic,copy)NSString *author_intro;
@property (nonatomic,copy)NSString *author_name;
@property (nonatomic,copy)NSString *big_cover;
@property (nonatomic,copy)NSString *briefinfo;
@property (nonatomic,copy)NSString *catalog;
//更新时间
@property (nonatomic,copy)NSString *create_time;
//@property (nonatomic,copy)NSString *enname;
// 原始为id
@property (nonatomic,copy)NSString *myId;
//名字
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *other_guide_ids;
@property (nonatomic,copy)NSString *pages;
//@property (nonatomic,copy)NSString *pinyin;
@property (nonatomic,copy)NSString *info;


//下载模型
@property (nonatomic,copy)NSDictionary *mobile_guide;
//@property (nonatomic,copy)NSDictionary *pad_guide;
@property (nonatomic,copy)NSNumber *status;
//@property (nonatomic,copy)NSNumber *times;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(BagModel *)appWithDic:(NSDictionary *)dic;


@end
