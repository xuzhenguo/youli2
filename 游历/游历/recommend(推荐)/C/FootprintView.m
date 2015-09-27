//
//  FootprintView.m
//  游历
//
//  Created by MAC—IOS on 15/9/27.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "FootprintView.h"
#import "RDVTabBarController.h"

@interface FootprintView ()

@end

@implementation FootprintView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 隐藏标签栏
- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

@end
