//
//  LocalityTableViewCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/23.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "LocalityTableViewCell.h"
#import "LocalityModel.h"
@implementation LocalityTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
//        [self.smallImageView.layer setCornerRadius:CGRectGetHeight([self.smallImageView.image bounds]) / 2];
//        self.smallImageView.layer.masksToBounds = YES;
        
     
    
        
        
        
    }
    return self;
}

-(void)updataCell:(LocalityModel *)app
{
    
    NSString *path = app.photo;
    NSURL *url = [NSURL URLWithString:path];
    [self.bigImageView sd_setImageWithURL:url];
    
    NSString *smallPath = app.avatar;
    NSURL *url2 = [NSURL URLWithString:smallPath];
    [self.smallImageView sd_setImageWithURL:url2];
    self.smallImageView.layer.cornerRadius = 60.0/2;
    self.smallImageView.layer.masksToBounds = YES;
    
    
    self.titleLabel.text = app.title;
    self.nameLabel.text = app.username;
    
    self.timeLable.text = [self timeStampWithYMD:app.lastpost];
    
    

}


- (NSString*)timeStampWithYMD:(NSString *)stamp{
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

    // Configure the view for the selected state
}

@end
