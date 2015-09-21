//
//  AuthorCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/20.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "AuthorCell.h"
#import "UILabel+Help.h"

@implementation AuthorCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *superView = self.contentView;
#pragma mark -- 作者头像
        UIImageView *imageView1 = [[UIImageView alloc]init];
        self.imageView2 = imageView1;
        imageView1.backgroundColor = [UIColor redColor];
        
        //        圆角效果
        [imageView1.layer setCornerRadius:0.8];
         imageView1.layer.masksToBounds = YES;
        [super addSubview:imageView1];
        
        [imageView1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(10);
            make.top.equalTo(superView.top).offset(5);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
#pragma mark -- 横线
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor grayColor];
        
        view.alpha = 0.8;
        [superView addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(10);
            make.top.equalTo(imageView1.bottom).offset(0);
            make.width.equalTo(SCREEN_WIDHT-20);
            make.height.equalTo(1.5);
        }];
        
//        内容表格
        
        UILabel *label = [[UILabel alloc]init];
        self.contentLabel = label;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:16];

        
        [superView addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(10);
            make.top.equalTo(view.bottom).offset(5);
            make.width.equalTo(SCREEN_WIDHT-20);
            make.bottom.equalTo(superView.bottom).offset(-5);
        }];
        
        
#pragma mark -- 作者名
        UILabel *nameLable = [[UILabel alloc]init];
        self.nameLable1 = nameLable;
        [superView addSubview:nameLable];
        
        [nameLable makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView1.right).offset(10);
            make.width.equalTo(SCREEN_WIDHT-150);
            make.height.equalTo(30);
            make.centerY.equalTo(imageView1.centerY);
        
        }];
    }
    return self;
}

@end
