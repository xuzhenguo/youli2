//
//  MainViewController.h
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
@property (nonatomic,strong)UITableView *table;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)int Hnum;
@property(nonatomic,strong)MBProgressHUD *HUD;
@end
