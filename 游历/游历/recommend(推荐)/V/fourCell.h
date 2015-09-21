//
//  fourCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlaceMadel;
@interface fourCell : UITableViewCell
@property(nonatomic,strong)UIImageView *PlaceImage;
@property(nonatomic,strong)UILabel *titleLable;
@property (nonatomic,copy)void(^blck)(int);
-(void)updataApp:(NSArray *)app;
@end
