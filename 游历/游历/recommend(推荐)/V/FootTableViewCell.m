//
//  FootTableViewCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootTableViewCell.h"
#import "FootModel.h"
#import "UILabel+Help.h"
@implementation FootTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)upDataModel:(FootModel *)app
{
    
    self.TitleLable.text = app.title;
    self.nameLbale.text = app.username;
    
    NSString *path = app.photo;
    
    NSURL *url = [NSURL URLWithString:path];
    
    [self.bigImage sd_setImageWithURL:url];
    
    
    NSString *path1 = app.avatar;
    NSURL *url1 = [NSURL URLWithString:path1];
    [self.smallImage sd_setImageWithURL:url1];
    self.smallImage.layer.cornerRadius = 60.0/2;
    self.smallImage.layer.masksToBounds = YES;

    
    NSString *string = [NSString stringWithFormat:@"%@个旅行地",app.count];
    self.numbLable.text = string;
    
    NSString *description = [NSString stringWithFormat:@"        %@",app.myDescription];
    self.countLabel.text = description;
    
//    调整高度
    
    [self.countLabel AdjustCellHight];
    
    
    CGRect frame = self.frame;
    frame.size.height = self.countLabel.frame.size.height +150;

    self.frame = frame;
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
