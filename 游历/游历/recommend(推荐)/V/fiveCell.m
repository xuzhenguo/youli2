//
//  fiveCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "fiveCell.h"
#import "tripModel.h"
@implementation fiveCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
 
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
           self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *superView = self.contentView;
        
#pragma mark -- 图片
        
        UIImageView *image = [[UIImageView alloc]init];
        self.avatarImageView = image;
        image.backgroundColor = [UIColor grayColor];
        [superView addSubview:image];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.mas_left).offset(10);
            make.top.equalTo(superView.mas_top).offset(5);
            make.width.equalTo(100.0);
            make.height.equalTo(70.0);
        }];
        
#pragma mark -- 标题内容
        
        UILabel *titelabel = [[UILabel alloc]init];
        titelabel.numberOfLines = 2;
        self.titleStr  = titelabel;
        [superView addSubview:titelabel];
        [titelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.right).offset(5);
            make.top.equalTo(superView.mas_top).offset(5);
            make.right.equalTo(superView.right).offset(-10);
            make.height.equalTo(55);
        }];
        
#pragma mark -- 作者
        UILabel *namelabel = [[UILabel alloc]init];
        namelabel.font = [UIFont boldSystemFontOfSize:12];
        namelabel.textColor = [UIColor grayColor];
        self.usernameStr = namelabel;
        [superView addSubview:namelabel];
        [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titelabel.left).offset(0);
            make.bottom.equalTo(superView.bottom).offset(0);
            make.width.equalTo(100.0);
            make.height.equalTo(20.0);
            
        }];
        
#pragma mark -- 时间
        UILabel *timeLabel = [[UILabel alloc]init];
        [superView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.right).offset(0);
            make.bottom.equalTo(superView.bottom).offset(0);
            make.height.equalTo(20);
            make.width.equalTo(100.0);
        }];
        
    }
    return self;
    
}
-(void)upData:(tripModel *)app
{
    NSString *path =  app.avatar;
    NSURL *url = [NSURL URLWithString:path];
    [self.avatarImageView sd_setImageWithURL:url];
    self.titleStr.text = app.title;
    self.usernameStr.text = app.username;
}
@end
