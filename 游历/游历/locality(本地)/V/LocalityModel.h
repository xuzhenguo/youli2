//
//  LocalityModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/23.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalityModel : NSObject

@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *lastpost;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *replys;
@property(nonatomic,copy)NSString *likes;
@property(nonatomic,copy)NSString *view_url;
@property(nonatomic,copy)NSString *view_author_url;
-(instancetype)initWithDic:(NSDictionary *)Dic;
+(LocalityModel *)appWithDic:(NSDictionary *)Dic;
@end
