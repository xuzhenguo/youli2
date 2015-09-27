//
//  UIScrollView+PullScale.m
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "UIScrollView+PullScale.h"
#import "CorePullScaleImageView.h"
#import <objc/runtime.h>


@interface UIScrollView ()

@property (weak, nonatomic) CorePullScaleImageView *imageV;

@end


#pragma mark - 运行时相关
static char CorePullScaleImageViewKey;

@implementation UIScrollView (PullScale)


/**
 *  添加一个下拉放大的功能
 *
 *  @param vc                   所属控制器
 *  @param imgName              图片名
 *  @param originalHeight       imageView的初始高度（关系到contentInset及contentOffset）
 */
-(void)addPullScaleFuncInVC:(UIViewController *)vc imgName:(NSString *)imgName imgUrl:(NSString *)url originalHeight:(CGFloat)originalHeight headURl:(NSString *)headURl name:(NSString *)nameStr hasNavBar:(BOOL)hasNavBar{
    
#pragma mark - 背景图片
    
    CorePullScaleImageView *imageV=[[CorePullScaleImageView alloc] init];
    NSURL *urlBig = [NSURL URLWithString:url];
    
    [imageV sd_setImageWithURL:urlBig];
    
#pragma mark - 头像
    
    NSURL *urlSmall = [NSURL URLWithString:headURl];
    UIImageView *view = [[UIImageView alloc]init];
    [view sd_setImageWithURL:urlSmall];
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake((SCREEN_WIDHT - 60)/2,20,60,60);
    view.layer.cornerRadius = 60/2;
    view.layer.masksToBounds = YES;
    [imageV addSubview:view];
    
#pragma mark - name
    
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake((SCREEN_WIDHT - 200)/2, 90, 200,30);
    if (nameStr != nil) {
        label.text = nameStr;
        
    }
      [imageV addSubview:label];
    
    
    //记录
    self.imageV=imageV;
    
    //数据传递
    imageV.hasNavBar=hasNavBar;
    imageV.originalHeight=originalHeight;
    
//    imageV.imgName=imgName;
    imageV.vc=vc;

    CGFloat height=originalHeight;

    
    /**
     *  contentInset
     */
    //取出之前的contentInset
    UIEdgeInsets contentInset=self.contentInset;
    
    //设置contentInset
    contentInset.top+=height;
    self.contentInset=contentInset;
    
    
    /**
     *  contentOffset
     */
    //取出之前的contentOffset
    CGPoint contentOffsett=self.contentOffset;
    
    //设置contentOffset
    contentOffsett.y-=height;
    self.contentOffset=contentOffsett;
    
    //添加控件
    [self addSubview:imageV];
}


#pragma mark 使用运行时模拟成员变量：imageV
-(void)setImageV:(CorePullScaleImageView *)imageV{
    [self willChangeValueForKey:@"CorePullScaleImageViewKey"];
    objc_setAssociatedObject(self, &CorePullScaleImageViewKey,
                             imageV,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"CorePullScaleImageViewKey"];
}


-(CorePullScaleImageView *)imageV{
    return objc_getAssociatedObject(self, &CorePullScaleImageViewKey);
}




@end
