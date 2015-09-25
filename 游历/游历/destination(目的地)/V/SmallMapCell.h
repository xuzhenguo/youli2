//
//  SmallMapCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/24.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallMapCell : UITableViewCell
@property(nonatomic,copy)void(^blok)(NSArray *arr);
@end
