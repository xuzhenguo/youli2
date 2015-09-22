

//
//  collectModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/23.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "collectModel.h"

@implementation collectModel
-(instancetype)initWithDic:(NSDictionary *)dic
{
     
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(collectModel *)appWithDic:(NSDictionary *)dic
{
    collectModel *app = [[collectModel alloc]initWithDic:dic];
    return app;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(id)valueForKey:(NSString *)key{
    return nil;
}
@end
