//
//  FootModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootModel.h"

@implementation FootModel

-(instancetype)initWithDic:(NSDictionary*)dic
{
    if (self = [super init]) {
        [super setValuesForKeysWithDictionary:dic];
    }
    return self;
    
}
+(FootModel *)appWithDic:(NSDictionary *)dic
{
    
    FootModel *app = [[FootModel alloc]initWithDic:dic];
    return app;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"id"]) {
        self.myId = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.myDescription = value;
    }

}




-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}




@end
