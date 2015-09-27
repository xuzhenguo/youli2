//
//  FoodDetailsModel.h
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodDetailsModel : NSObject
@property(nonatomic,copy)NSString *firstname;
@property(nonatomic,copy)NSString *chinesename;
@property(nonatomic,copy)NSString *countryname;
@property(nonatomic,copy)NSString *cityname;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *myDescription;


-(instancetype)initWithDic:(NSDictionary *)Dic;
+(FoodDetailsModel *)appWithDic:(NSDictionary *)Dic;
@end
