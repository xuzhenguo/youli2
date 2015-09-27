//
//  FootTableViewCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FootModel;
@interface FootTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UIImageView *smallImage;
@property (weak, nonatomic) IBOutlet UILabel *TitleLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLbale;

@property (weak, nonatomic) IBOutlet UILabel *numbLable;

-(void)upDataModel:(FootModel *)app;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
