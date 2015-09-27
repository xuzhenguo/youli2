//
//  FootDetailsViewController.h
//  游历
//
//  Created by MAC—IOS on 15/9/26.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "MainViewController.h"
#import "FootModel.h"
@interface FootDetailsViewController : MainViewController
@property(nonatomic,retain)FootModel *model;
@property(nonatomic,copy)NSString *myID;
@end
