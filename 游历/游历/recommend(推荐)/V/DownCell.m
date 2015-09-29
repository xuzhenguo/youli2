//
//  DownCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "DownCell.h"
#import "BagModel.h"
#import "UILabel+Help.h"
@implementation DownCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellAccessoryNone;
        UIView *superView = self.contentView;
#pragma mark -- 地名
        self.nameLbale = [[UILabel alloc]init];
        self.nameLbale.textColor = [UIColor grayColor];
        [superView addSubview:_nameLbale];
        
        [_nameLbale makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(40);
            make.top.equalTo(superView.top).offset(10);
            make.width.equalTo(100);
            make.height.equalTo(30);
        }];
        
        
#pragma mark --  作者
        self.authorLabel = [[UILabel alloc]init];

        self.authorLabel.font = [UIFont systemFontOfSize:12];
        self.authorLabel.textColor = [UIColor grayColor];
        [superView addSubview:_authorLabel];
        [_authorLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(40);
            make.top.equalTo(_nameLbale.bottom).offset(2);
            make.width.equalTo(100);
            make.height.equalTo(20);
        }];
        
#pragma mark -- 分界线
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor grayColor];
        [superView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView.top).offset(10);
            make.right.equalTo(superView.right).offset(-80);
            make.width.equalTo(1.4);
            make.height.equalTo(80);
        }];
        
        
#pragma mark -- 进度
        
        self.planLbel = [[UILabel alloc]init];
        self.planLbel.hidden = YES;
        self.planLbel.font = [UIFont systemFontOfSize:12];
        self.planLbel.textColor = [UIColor grayColor];
        [superView addSubview:self.planLbel];
        [self.planLbel makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.centerY);
            make.right.equalTo(view.left).equalTo(-5);
            make.width.equalTo(100);
            make.height.equalTo(25);
        }];
        
#pragma mark -- 进度条
        self.progressView =  [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
//        左边颜色
        _progressView.progressTintColor = [UIColor cyanColor];
        _progressView.trackTintColor = [UIColor grayColor];
        _progressView.progress = 0;
        _progressView.hidden = YES;
        
        [superView addSubview:_progressView];
        
        [_progressView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(35);
            make.top.equalTo(self.authorLabel.bottom).offset(10);
            make.height.equalTo(2.5);
            make.right.equalTo(view.left).equalTo(-35);
        }];
        
#pragma mark -- 内容Lbale
        self.contentLbale = [[UILabel alloc]init];
        self.contentLbale.textAlignment = NSTextAlignmentCenter;
        [superView addSubview:self.contentLbale];
         [self.contentLbale makeConstraints:^(MASConstraintMaker *make) {
             
             make.left.equalTo(superView.left).equalTo(20);
             make.top.equalTo(self.progressView.bottom).equalTo(20);
             make.right.equalTo(superView.right).equalTo(-20);
             make.bottom.equalTo(superView.bottom).offset(-10);
        
             
         }];
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn addTarget:self action:@selector(downData) forControlEvents:UIControlEventTouchUpInside];
        [_btn setBackgroundColor:[UIColor redColor]];
        [superView addSubview:self.btn];
        [self.btn makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(view.centerY).offset(0);
            make.left.equalTo(view.right).offset((80-44)/2);
            make.width.equalTo(44);
            make.height.equalTo(44);
            
            
        }];
 
        
        
    }
        return self;
 

}

-(void)upData:(BagModel *)app
{
    self.contentLbale.text = app.catalog;
    NSLog(@"%@",app.catalog);
    [self.contentLbale AdjustCellHight];
    [self.contentLbale AdjustCellHight];
    CGRect frame = self.frame;
    frame.size.height = self.contentLbale.frame.size.height +130;
    self.frame = frame;
    
    
    self.nameLbale.text = app.name;
    self.authorLabel.text = app.author_name;

    
    
}
-(void)downData
{
    
    self.block();
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
