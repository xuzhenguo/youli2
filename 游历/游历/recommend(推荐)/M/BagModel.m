//
//  bagModel.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "BagModel.h"

@implementation BagModel
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(BagModel *)appWithDic:(NSDictionary *)dic
{
    BagModel *bagModel = [[BagModel alloc]initWithDic:dic];
    return bagModel;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    
}
-(id)valueForKey:(NSString *)key
{
    return nil;
}

//进行归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.category_id forKey:@"category_id"];
    [aCoder encodeObject:self.category_title forKey:@"category_title"];
    [aCoder encodeObject:self.country_id forKey:@"country_id"];
    [aCoder encodeObject:self.country_name_cn forKey:@"country_name_cn"];
    [aCoder encodeObject:self.cover forKey:@"cover"];
    [aCoder encodeObject:self.cover_updatetime forKey:@"cover_updatetime"];
    [aCoder encodeObject:self.download forKey:@"download"];
    [aCoder encodeObject:self.guide_cnname forKey:@"guide_cnname"];
    [aCoder encodeObject:self.guide_enname forKey:@"guide_enname"];
    [aCoder encodeObject:self.guide_id forKey:@"guide_id"];
    [aCoder encodeObject:self.size forKey:@"update_time"];
    [aCoder encodeObject:self.author_icon forKey:@"author_icon"];
    [aCoder encodeObject:self.author_id forKey:@"author_id"];
    [aCoder encodeObject:self.author_intro forKey:@"author_intro"];
    [aCoder encodeObject:self.author_name forKey:@"author_name"];
    [aCoder encodeObject:self.big_cover forKey:@"big_cover"];
    [aCoder encodeObject:self.briefinfo forKey:@"briefinfo"];
    [aCoder encodeObject:self.catalog forKey:@"catalog"];
    [aCoder encodeObject:self.create_time forKey:@"create_time"];
    [aCoder encodeObject:self.myId forKey:@"myId"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.other_guide_ids forKey:@"other_guide_ids"];
    [aCoder encodeObject:self.pages forKey:@"pages"];
    [aCoder encodeObject:self.info forKey:@"info"];
    
    
    [aCoder encodeObject:self.mobile_guide forKey:@"mobile_guide"];
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeObject:self.other_guide_ids forKey:@"other_guide_ids"];

    
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    if (self = [super init]) {
        self.category_id = [aDecoder decodeObjectForKey:@"category_id"];
        self.category_title = [aDecoder decodeObjectForKey:@"category_title"];
        self.country_id = [aDecoder decodeObjectForKey:@"country_id"];
        self.country_name_cn = [aDecoder decodeObjectForKey:@"country_name_cn"];
        self.cover = [aDecoder decodeObjectForKey:@"cover"];
        self.cover_updatetime = [aDecoder decodeObjectForKey:@"cover_updatetime"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.download = [aDecoder decodeObjectForKey:@"download"];
        self.file = [aDecoder decodeObjectForKey:@"file"];
        self.guide_cnname = [aDecoder decodeObjectForKey:@"guide_cnname"];
        self.guide_enname = [aDecoder decodeObjectForKey:@"guide_enname"];
        self.guide_id = [aDecoder decodeObjectForKey:@"guide_id"];
        self.size = [aDecoder decodeObjectForKey:@"size"];
        self.update_time = [aDecoder decodeObjectForKey:@"update_time"];
        self.author_icon = [aDecoder decodeObjectForKey:@"author_icon"];
        self.author_id = [aDecoder decodeObjectForKey:@"author_id"];
        self.author_id = [aDecoder decodeObjectForKey:@"author_intro"];
        self.author_intro = [aDecoder decodeObjectForKey:@"author_name"];
        self.big_cover = [aDecoder decodeObjectForKey:@"big_cover"];
        self.briefinfo = [aDecoder decodeObjectForKey:@"briefinfo"];
        self.catalog = [aDecoder decodeObjectForKey:@"catalog"];
        self.create_time = [aDecoder decodeObjectForKey:@"create_time"];
        self.myId = [aDecoder decodeObjectForKey:@"myId"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.other_guide_ids = [aDecoder decodeObjectForKey:@"other_guide_ids"];
        self.pages = [aDecoder decodeObjectForKey:@"pages"];
        self.info = [aDecoder decodeObjectForKey:@"info"];
        self.mobile_guide = [aDecoder decodeObjectForKey:@"mobile_guide"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
    }
    return self;
    
}

@end
