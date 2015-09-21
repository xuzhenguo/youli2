//
//  DownCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BagModel;
@interface DownCell : UITableViewCell
@property(nonatomic,strong)UILabel *nameLbale;
@property(nonatomic,strong)UILabel *authorLabel;
@property(nonatomic,strong)UIProgressView *progressView;
@property(nonatomic,strong)UILabel *planLbel;
@property(nonatomic,strong)UILabel *contentLbale;
@property(nonatomic,copy)void(^block)(void);
@property(nonatomic,strong)UIButton *btn;
-(void)upData:(BagModel*)app;
@end
