//
//  secondCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "secondCell.h"
#define WIDE  50

@implementation secondCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *titlArr = @[@"猜你喜欢",@"热门国家",@"推荐美食",@"我的足迹"];
        NSArray *imageArr = @[@"cou_锦囊@2x",@"cou_plan@2x",@"cou_城市@2x.png",@"playIcon@2x"];
        UIView *superView = self.contentView;
        CGFloat  interval = (SCREEN_WIDHT -(4 * WIDE))/5;
        for (int i = 0 ; i < 4; i ++) {
            
            
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((interval + WIDE) *i+ interval, 15, WIDE, WIDE);
//            [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:imageArr[i]];
            [btn setBackgroundImage:image forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor grayColor];
            [btn.layer setCornerRadius:CGRectGetHeight([btn bounds]) / 2];
            btn.layer.masksToBounds = YES;
            btn.tag = i + 1;
            [btn addTarget:self action:@selector(top:) forControlEvents:UIControlEventTouchUpInside];
            
            [superView addSubview:btn];
            
            UILabel *lable = [[UILabel alloc]init];
            lable.frame = CGRectMake((interval + WIDE) *i+ interval, 75, WIDE, 20);
            lable.text = titlArr[i];
            lable.font = [UIFont boldSystemFontOfSize:12];
            lable.textColor = [UIColor lightGrayColor];
            lable.textAlignment = NSTextAlignmentCenter;
            [superView addSubview:lable];
     }
        
    }
    return self;
}

//按钮点击
-(void)top:(id)btn
{
    UIButton *btn1 = (UIButton *)btn;
    long n = btn1.tag;
    if (self.Block) {
        self.Block(n);
    }
    
    
}

@end
