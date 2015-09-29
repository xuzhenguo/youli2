//
//  CollectCell.h
//  游历
//
//  Created by MAC—IOS on 15/9/27.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectCell : UITableViewCell
@property(nonatomic,copy)void(^block)(void);
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLable;
- (IBAction)myBtn:(id)sender;

@end
