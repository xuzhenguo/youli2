//
//  downModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "downModel.h"

@implementation downModel
-(instancetype)initWith:(NSDictionary *)dic
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(downModel *)appWithDic:(NSDictionary *)dic
{
    downModel *app = [[downModel alloc]initWith:dic];
    return app;
}
@end
