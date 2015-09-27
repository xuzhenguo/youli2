//
//  FootModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FootModel : NSObject

@property(nonatomic,copy)NSString *myId;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *myDescription;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *username;


-(instancetype)initWithDic:(NSDictionary*)dic;
+(FootModel *)appWithDic:(NSDictionary *)dic;

@end
