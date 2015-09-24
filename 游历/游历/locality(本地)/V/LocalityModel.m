//
//  LocalityModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/23.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "LocalityModel.h"

@implementation LocalityModel
-(instancetype)initWithDic:(NSDictionary *)Dic
{
    if (self = [super init]){
        
        [self setValuesForKeysWithDictionary:Dic];
        
    }
        return self;
}
+(LocalityModel *)appWithDic:(NSDictionary *)Dic
{
    LocalityModel *app = [[LocalityModel alloc]initWithDic:Dic];
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
