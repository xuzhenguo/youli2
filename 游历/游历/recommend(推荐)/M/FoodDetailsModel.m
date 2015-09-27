//
//  FoodDetailsModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FoodDetailsModel.h"

@implementation FoodDetailsModel


-(instancetype)initWithDic:(NSDictionary *)Dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:Dic];
    }
    
    return self;
    
}
+(FoodDetailsModel *)appWithDic:(NSDictionary *)Dic
{
    FoodDetailsModel *app = [[FoodDetailsModel alloc]initWithDic:Dic];
    return app;
    
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"description"]) {
        
        self.myDescription = value;
    }

}
@end
