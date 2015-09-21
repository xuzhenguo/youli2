//
//  BagCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BagModel;
@interface BagCell : UITableViewCell
@property(nonatomic,strong)UILabel *cnname;
@property(nonatomic,strong)UILabel *country_name_cn;
@property(nonatomic,strong)UILabel *update_time;
@property(nonatomic,strong)UILabel *download;
@property(nonatomic,strong)UIImageView *myImageView;
-(void)updata:(BagModel *)app;
@end
