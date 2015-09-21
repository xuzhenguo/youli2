//
//  tripModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "tripModel.h"

@implementation tripModel
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(tripModel *)appWithDic:(NSDictionary *)dic
{
    tripModel *app = [[tripModel alloc]initWithDic:dic];
    return app;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(id)valueForKeyPath:(NSString *)keyPath
{
    return nil;
}


@end
