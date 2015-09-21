//
//  tripModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tripModel : NSObject
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *view_url;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(tripModel *)appWithDic:(tripModel *)dic;

@end
