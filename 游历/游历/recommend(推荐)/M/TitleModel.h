//
//  TitleModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleModel : NSObject
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *photo;


-(instancetype)initWithDic:(NSDictionary *)dic;
+(TitleModel *)appDic:(NSDictionary *)dic;

@end
