//
//  collectModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/23.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectModel : NSObject
@property(nonatomic,assign)int pid;
@property(nonatomic,copy)NSString *catename;
@property(nonatomic,copy)NSString *catename_en;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *flag;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(collectModel *)appWithDic:(NSDictionary *)dic;
@end
