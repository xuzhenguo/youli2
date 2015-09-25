//
//  ButCellTableViewCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/24.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "ButCellTableViewCell.h"

#define kDefaultColumn                  5
#define kDefaultHieght                  60.f

#define INTERVALWITH       10.0

@implementation ButCellTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.selectionStyle = UITableViewCellAccessoryNone;
        [self createView];
    }
    return self;

}



#pragma mark - 创建按钮
-(void)createView
{
    
   
     NSArray *ImageArr = @[@"nearby_Search_Type_Nearby@2x",@"nearby_Search_Type_Res@2x",@"nearby_Search_Type_KTV@2x",@"nearby_Search_Type_Cafe@2x",@"nearby_Search_Type_Travel@2x",@"nearby_Search_Type_Postoffice@2x",@"nearby_Search_Type_Shopping@2x",@"nearby_Search_Type_Bank@1x",@"nearby_Search_Type_Hotel@2x",@"nearby_Search_Type_Policestation@2x",@"nearby_Search_Type_Railway@2x",@"nearby_Search_Type_Stop@2x",@"nearby_Search_Type_Expand@2x"];
    
    
    float with = (SCREEN_WIDHT - 6 * INTERVALWITH) /kDefaultColumn;
    
    for (int i = 0 ; i < 13 ; i ++ ) {
        
//        行
        int row = i / kDefaultColumn;
        
        
//        列
        int col = i % kDefaultColumn;
        
        
        CGFloat x = INTERVALWITH + col * (INTERVALWITH + with);
        
        CGFloat y = INTERVALWITH + row * (INTERVALWITH + kDefaultHieght);
        
        UIView * view = [[UIView alloc]init];
//        view.backgroundColor = WColorDarkGray;
        view.frame = CGRectMake(x, y, with, kDefaultHieght);
        [self.contentView addSubview:view];
        
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(seek:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(10, 0, with -20, kDefaultHieght-20);
        
        [btn setBackgroundImage:[UIImage imageNamed:ImageArr[i]] forState:UIControlStateNormal];
        btn.tag = 30 +i ;
        [view addSubview:btn];
        
    
        UILabel *lable = [[UILabel alloc]init];
        lable.text = arrTitle[i];
        lable.tag = 50 + i;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textAlignment =  NSTextAlignmentCenter;
        lable.textColor = [UIColor grayColor];

        lable.frame = CGRectMake(0, kDefaultHieght -20, with, 20);
        [view addSubview:lable];
    
    }
    
    
}
-(void)seek:(UIButton *)btn
{
    int n = (int)btn.tag;
    if (n == 42) {

        UILabel *lable1 = (UILabel *)[self.contentView viewWithTag:62];
        
        if ([lable1.text isEqualToString:@"展开地图"]) {
            lable1.text = @"收起地图";
            [btn setBackgroundImage:[UIImage imageNamed:@"nearby_Search_Type_Col@2x.png"] forState:UIControlStateNormal];
        }else{
            lable1.text = @"展开地图";
            [btn setBackgroundImage:[UIImage imageNamed:@"nearby_Search_Type_Expand@2x.png"] forState:UIControlStateNormal];
        }
            }
    
    NSString *idStr =  arrTitle[n - 30];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"idStr" object:idStr];
    
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
