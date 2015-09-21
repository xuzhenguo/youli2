//
//  TitleImageTableViewCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "TitleImageTableViewCell.h"
#import "BagModel.h"
@implementation TitleImageTableViewCell
{
    UIImageView * imageView;
    UILabel *downNumLbale;
    UILabel *timeLable;
    UILabel *sizeLbale;
    UILabel *pagLbale;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *superView = self.contentView;
        imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(0, 0, SCREEN_WIDHT, 150);
        imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:imageView];
        
        
#pragma mark -- 时间
        timeLable = [[UILabel alloc]init];
        timeLable.font = [UIFont systemFontOfSize:12];
        timeLable.textColor = [UIColor whiteColor];
        [superView addSubview:timeLable];
        [timeLable makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(10);
            make.bottom.equalTo(superView.bottom).offset(-5);
            make.width.equalTo(150);
            make.height.equalTo(20);
            
        }];
        
        
#pragma mark -- 下载次数
        downNumLbale = [[UILabel alloc]init];
        downNumLbale.font = [UIFont systemFontOfSize:12];
        downNumLbale.textColor = [UIColor whiteColor];
        [superView addSubview:downNumLbale];
        [downNumLbale makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.left).offset(10);
            make.bottom.equalTo(timeLable.top).offset(0);
            make.width.equalTo(150);
            make.height.equalTo(20);
            
        }];
       

      
        
        
#pragma mark -- 文件大小
      sizeLbale  = [[UILabel alloc]init];
        sizeLbale.font = [UIFont systemFontOfSize:12];
        sizeLbale.textColor = [UIColor whiteColor];
        [superView addSubview:sizeLbale];
        [sizeLbale makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.right).offset(-10);
            make.bottom.equalTo(superView.bottom).offset(0);
            make.width.equalTo(150);
            make.height.equalTo(20);
        }];
        
        
#pragma mark -- 页数
        
        pagLbale = [[UILabel alloc]init];
        pagLbale.font = [UIFont systemFontOfSize:12];
        pagLbale.textColor = [UIColor whiteColor];
        [superView addSubview:pagLbale];
        
        [pagLbale makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.right).offset(-10);
            make.bottom.equalTo(sizeLbale.top).offset(0);
            make.width.equalTo(150);
            make.height.equalTo(20);
        }];
        
        
        
        
        
    }
    
    return self;
}

-(void)upData:(BagModel *)app
{
     [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/670_420.jpg?%@",app.cover,app.cover_updatetime]]];
    downNumLbale.text = [NSString stringWithFormat:@"下载次数: %@",app.download.stringValue];
    pagLbale.text = [NSString stringWithFormat:@"页数:%@",app.pages];
    NSString *tiem = [NSString stringWithFormat:@"跟新日期:%@",[self timeStampWithYMD:app.cover_updatetime]];
    timeLable.text = tiem;
    sizeLbale.text = [NSString stringWithFormat:@"大小:%@",app.size];
}

//时间戳转化为时间字符串
-(NSString*)timeStampWithYMD:(NSString *)stamp{
    NSTimeInterval time=[stamp doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:detaildate];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
