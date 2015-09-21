//
//  MainViewController.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "RDVTabBarItem.h"
#import "RecommendViewController.h"
#import "CollectViewController.h"
#import "DestinationViewController.h"
#import "LocalityViewController.h"
#import "MainUINavigationController.h"


@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark -- 推荐
    RecommendViewController *rec = [[RecommendViewController alloc]init];
    MainUINavigationController *recNav = [[MainUINavigationController alloc]initWithRootViewController:rec];
    
    
    
#pragma mark -- 锦囊
    CollectViewController *coll = [[CollectViewController alloc]init];
    MainUINavigationController *collNav = [[MainUINavigationController alloc]initWithRootViewController:coll];
    
    
    
    
#pragma mark -- 目的地
    DestinationViewController *des = [[DestinationViewController alloc]init];
    MainUINavigationController *desNav = [[MainUINavigationController alloc]initWithRootViewController:des];
    
    
    
#pragma mark -- 当地
    LocalityViewController *local = [[LocalityViewController alloc]init];
    MainUINavigationController *localNav = [[MainUINavigationController alloc]initWithRootViewController:local];
    


    
    [self setViewControllers:@[recNav,collNav,desNav,localNav]];
    
    [self customizeTabBarForController:self];

    
    
}


- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"homePage@2x.png", @"pack@2x", @"destination@2x", @"trip@2x"];
    
//    NSArray *titles = @[@"推荐",@"锦囊",@"目的地",@"当地"];
    NSArray *titles = nil;
    
    NSInteger index = 0;
    
    NSDictionary *textAttributes_normal = nil;
    NSDictionary *textAttributes_selected = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        textAttributes_normal = @{
                                  NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  NSForegroundColorAttributeName: [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1.0],
                                  };
        textAttributes_selected = @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName: [UIColor colorWithRed:214.0/255 green:102.0/255 blue:64.0/255 alpha:1.0],
                                    };
    }
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        
        item.unselectedTitleAttributes = textAttributes_normal;
        item.selectedTitleAttributes = textAttributes_selected;
        
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"highlight_%@",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        item.title = titles[index];
        
        index++;
        
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
