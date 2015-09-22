//
//  RecipeCollectionHeaderView.m
//  游历
//
//  Created by MAC—IOS on 15/9/22.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "RecipeCollectionHeaderView.h"

@implementation RecipeCollectionHeaderView
-(void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor redColor];
}

//每次创建都调用
-(void)layoutSubviews
{
    
}

//第一次使用会掉用一次
+(void)initialize
{
    
}

@end
