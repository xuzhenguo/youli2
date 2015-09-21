//
//  downModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface downModel : NSObject
@property(nonatomic,copy)NSString *file;
@property(nonatomic,copy)NSString *page;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *update_time;
-(instancetype)initWith:(NSDictionary *)dic;
+(downModel *)appWithDic:(NSDictionary *)dic;
@end
