//
//  BagCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "BagCell.h"
#import "BagModel.h"
@implementation BagCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellAccessoryNone;
        
        UIView *superView = self.contentView;
#pragma mark -- 图片
        UIImageView *imageView = [[UIImageView alloc]init];
        self.myImageView = imageView;
        imageView.backgroundColor = [UIColor grayColor];
        [super addSubview:imageView];
        
        [imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).equalTo(5);
            make.top.equalTo(superView.top).equalTo(5);
            make.height.equalTo(90);
            make.width.equalTo(60);
        }];
        
        
#pragma mark -- 地名
        UILabel *Titlelabel = [[UILabel alloc]init];
        Titlelabel.font = [UIFont boldSystemFontOfSize:20];
        self.cnname = Titlelabel;
        Titlelabel.textColor = [UIColor grayColor];
        [superView addSubview:Titlelabel];
        [Titlelabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.right).equalTo(15);
            make.top.equalTo(superView.top).equalTo(15);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        
#pragma mark -- 时间
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.textColor = [UIColor grayColor];
        timeLabel.font = [UIFont systemFontOfSize:12];
        self.update_time = timeLabel;
        [superView addSubview:timeLabel];
        [timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.right).equalTo(15);
            make.bottom.equalTo(superView.bottom).offset(-5);
            make.width.equalTo(100);
            make.height.equalTo(20);
        }];
#pragma mark -- 下载次数
        UILabel *numLabel = [[UILabel alloc]init];
        numLabel.textAlignment = NSTextAlignmentRight;
        numLabel.textColor = [UIColor grayColor];
        numLabel.font = [UIFont systemFontOfSize:12];
        self.download = numLabel;
        [superView addSubview:numLabel];
        [numLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.right).equalTo(-5);
            make.bottom.equalTo(superView.bottom).offset(-5);
            make.width.equalTo(120);
            make.height.equalTo(20);
        }];
        
        
        
#pragma mark -- 台名
        UILabel *stageLabel = [[UILabel alloc]init];
        stageLabel.textColor = [UIColor grayColor];
        stageLabel.font = [UIFont systemFontOfSize:14];
        self.country_name_cn = stageLabel;
        [superView addSubview:stageLabel];
        [stageLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.right).equalTo(15);
            make.top.equalTo(Titlelabel.bottom).offset(0);
            make.width.equalTo(100);
            make.height.equalTo(20);
        }];
        
        
    }

        return self;
}
-(void)updata:(BagModel *)app
{
    self.cnname.text = app.guide_cnname;
    self.country_name_cn.text = app.country_name_cn;
    NSString *time = [NSString stringWithFormat:@"下载:%@",[app.download  stringValue]];
    self.download.text = time;
    
    self.update_time.text = [self timeStampWithYMD:app.update_time];
    
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/260_390.jpg?%@",app.cover,app.cover_updatetime]]];

    
    
}
//时间戳转化为时间字符串
- (NSString*)timeStampWithYMD:(NSString *)stamp{
    NSTimeInterval time=[stamp doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:detaildate];
}
@end
