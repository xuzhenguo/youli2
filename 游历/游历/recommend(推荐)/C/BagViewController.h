//
//  BigViewController.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "BagCell.h"
@interface BagViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>

@property(nonatomic,copy)NSString *myId;
@property(nonatomic,copy)UITableView *table;

@end
