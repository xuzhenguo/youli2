//
//  fiveCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tripModel;
@interface fiveCell : UITableViewCell
@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *usernameStr;
@property(nonatomic,strong)UILabel *titleStr;

-(void)upData:(tripModel *)app;
@end
