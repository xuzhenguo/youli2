//
//  FootDetailsTableViewCell1.h
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoodDetailsModel;
@interface FootDetailsTableViewCell1 : UITableViewCell

-(void)updata:(FoodDetailsModel*)app;
@property (weak, nonatomic) IBOutlet UILabel *titleLbale;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end
