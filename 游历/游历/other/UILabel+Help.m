//
//  UILabel+Help.m
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "UILabel+Help.h"

@implementation UILabel (Help)
-(void)AdjustFontSizeWithMinSize:(CGFloat) min AndMaxSize:(CGFloat) max IsFull:(BOOL)isfull
{
    
    self.numberOfLines=0;
    self.lineBreakMode=NSLineBreakByCharWrapping;
    NSLog(@"%f",self.frame.size.width);
    CGSize Allsize=[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    if (Allsize.height>self.frame.size.height) {
        [self AdjustFontSizeWithMinSize:min AndMaxSize:max];
    }else
    {
        if (isfull) {
            [self AdjustFontSizeWithMinSize:min AndMaxSize:max];
        }
    }
    
}
- (void)AdjustCurrentAttributeTextWithLineSpacing:(NSInteger)space
{
    if (self.text) {
        self.numberOfLines=0;
        self.lineBreakMode=NSLineBreakByCharWrapping;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        [paragraphStyle setLineSpacing:space];//调整行间距
        //
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
        self.attributedText = attributedString;
        
        NSDictionary *dic =[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,paragraphStyle,NSParagraphStyleAttributeName, nil];
        
        CGSize Allsize=[self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, 990) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|
                        NSStringDrawingUsesFontLeading       attributes:dic context:nil].size;
        
        self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, Allsize.width, Allsize.height);
        
    }else
    {
        
    }
}
- (void)AdjustCurrentFont
{
    [self AdjustWithFont:self.font];
}
- (void)AdjustWithFont:(UIFont *)font
{
    self.numberOfLines=0;
    
    CGSize Allsize=[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    NSLog(@"%@",self.text);
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, Allsize.width, Allsize.height);
    self.lineBreakMode=NSLineBreakByCharWrapping;
    
}
- (void)SetBorderWithcornerRadius:(CGFloat)radius BorderWith:(CGFloat)width AndBorderColor:(UIColor *)color
{
    self.layer.cornerRadius=radius;
    self.layer.borderWidth=width;
    self.layer.borderColor=[color CGColor];
}
-(void)AdjustFontSizeWithMinSize:(CGFloat) min AndMaxSize:(CGFloat) max
{
    BOOL isad=NO;
    
    for (CGFloat i=max; i>=min; i--) {
        CGSize Allsize=[self.text sizeWithFont:[UIFont systemFontOfSize:i] constrainedToSize:CGSizeMake(self.frame.size.width, 1000) lineBreakMode:NSLineBreakByCharWrapping];
        if (Allsize.height<=self.frame.size.height) {
            isad=YES;
            self.font=[UIFont systemFontOfSize:i];
            break;
        }
    }
    if (!isad) {
        self.font=[UIFont systemFontOfSize:min];
    }
}

-(void)AdjustCellHight
{
    //
    //            ========自动调整表格高度=========
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    //            self.content.text = app.content;
    //设置label的最大行数
    self.numberOfLines = 20;
    CGSize size = CGSizeMake(SCREEN_WIDHT, 1000);
    CGSize labelSize = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
//    frame.size.height = self.frame.size.height+100;

}

@end
