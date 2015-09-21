//
//  BagDetailViewController.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface BagDetailViewController : MainViewController
@property (nonatomic,copy)NSString *guide_id;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger integer;
@end
