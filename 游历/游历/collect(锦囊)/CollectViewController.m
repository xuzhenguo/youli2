//
//  CollectViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "CollectViewController.h"
#import "lableColor.h"
#import "MainTableViewController.h"
@interface CollectViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * smallScroll;
@property(nonatomic,strong)UIScrollView * bigScroll;
@property(nonatomic,strong)lableColor * titleLable;
@property(nonatomic,assign)CGFloat beginOffSetX;
@property(nonatomic,strong)NSArray * arrayLists;


@end

@implementation CollectViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = YES;
    
    self.navigationItem.title = @"资讯";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.smallScroll = [[UIScrollView alloc]init];
    self.smallScroll.showsVerticalScrollIndicator = NO;
    self.smallScroll.showsHorizontalScrollIndicator = NO;
    //  self.smallScroll.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.smallScroll];
    
    
    self.bigScroll = [[UIScrollView alloc]init];
    self.bigScroll.showsHorizontalScrollIndicator = NO;
    self.bigScroll.showsVerticalScrollIndicator = NO;
    self.bigScroll.pagingEnabled = YES;
    self.bigScroll.delegate = self;
    
    [self addObject];
    [self addLable];
    
    
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScroll.contentSize = CGSizeMake(contentX, 0);
    
    [self.view addSubview:self.bigScroll];
    
    UIViewController * views = [self.childViewControllers firstObject];
    views.view.frame = CGRectMake(0, 0, self.bigScroll.bounds.size.width, self.bigScroll.bounds.size.height);
    [self.bigScroll addSubview:views.view];
    
    [self.smallScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.bigScroll.mas_top).offset(0);
        make.height.equalTo(@40);
    }];
    
    [self.bigScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    
    lableColor * lable = [self.smallScroll.subviews firstObject];

}

-(void)addObject{
    _arrayLists = @[@"热门",@"亚洲", @"欧洲",@"北美洲", @"南美洲",@"大洋洲", @"非洲",@"南极洲"];
    for (int i = 0; i < self.arrayLists.count ; i++) {
        MainTableViewController * inforStation = [[MainTableViewController alloc]init];
        inforStation.title = self.arrayLists[i];
        [self addChildViewController:inforStation];
    }
}
-(void)addLable{
    for (int i = 0; i < 8; i++) {
        CGFloat lblW = 80;
        CGFloat lblH = 40;
        CGFloat lblY = 0;
        CGFloat lblX = i * lblW;
        lableColor * lab1 = [[lableColor alloc]init];
        UIViewController * views = self.childViewControllers[i];
        lab1.text = views.title;
        lab1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lab1.font = [UIFont fontWithName:@"lab" size:24];
        [self.smallScroll addSubview:lab1];
        lab1.tag = i;
        lab1.userInteractionEnabled = YES;
        [lab1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    self.smallScroll.contentSize = CGSizeMake(80*8, 0);
    
}
-(void)lblClick:(UITapGestureRecognizer *)tap
{
    lableColor * titlelable = (lableColor *)tap.view;
    CGFloat offsetX = titlelable.tag * self.bigScroll.frame.size.width;
    CGFloat offsetY = self.bigScroll.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.bigScroll setContentOffset:offset animated:YES];
    
}
/**
 *  滚动结束后调用
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    /**
     *  获得索引
     */
    NSUInteger index = scrollView.contentOffset.x/self.bigScroll.frame.size.width;
    /**
     *  滚动标题栏
     */
    lableColor * titlelable = (lableColor *)self.smallScroll.subviews[index];
    CGFloat offsetX = titlelable.center.x - self.smallScroll.frame.size.width * 0.5;
    CGFloat offsetMax = self.smallScroll.contentSize.width - self.smallScroll.frame.size.width;
    if (offsetX < 0) {
        offsetX = 0;
    }else if (offsetX > offsetMax){
        offsetX = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetX, self.smallScroll.contentOffset.y);
    [self.smallScroll setContentOffset:offset animated:YES];
    /**
     *  添加控制器
     */
    MainTableViewController *newsVc = self.childViewControllers[index];
    newsVc.index = index;
    
    [self.smallScroll.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index) {
            lableColor *temlabel = self.smallScroll.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    
    if (newsVc.view.superview) return;
    
    newsVc.view.frame = scrollView.bounds;
    [self.bigScroll addSubview:newsVc.view];
    
}
/**
 * 滚动结束（手势导致）
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
/**
 *  正在滚动
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    lableColor *labelLeft = self.smallScroll.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScroll.subviews.count)
    {
        lableColor *labelRight = self.smallScroll.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
    
}

@end
