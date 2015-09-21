//
//  PlaceMadel.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceMadel : NSObject
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *label;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(PlaceMadel *)appWithDic:(NSDictionary *)dic;

@end
