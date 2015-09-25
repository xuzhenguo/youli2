//
//  LocationViewController.h
//  游历
//
//  Created by MAC—IOS on 15/9/25.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "MainViewController.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

#import <AMapSearchKit/AMapSearchAPI.h>

@interface LocationViewController : MainViewController
@property(nonatomic,strong)AMapPOI *dataStr;
@end
