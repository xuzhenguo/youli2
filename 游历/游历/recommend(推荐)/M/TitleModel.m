//
//  TitleModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "TitleModel.h"

@implementation TitleModel

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(TitleModel *)appDic:(NSDictionary *)dic
{
    
    TitleModel *app = [[TitleModel alloc]initWithDic:dic];
    return app;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  
}

-(id)valueForKey:(NSString *)key
{
    return nil;
}

@end
