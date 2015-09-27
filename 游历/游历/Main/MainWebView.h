//
//  MainWebView.h
//  游历
//
//  Created by MAC—IOS on 15/9/18.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainWebView : UIViewController<UIWebViewDelegate,MBProgressHUDDelegate>
@property(nonatomic,strong)MBProgressHUD *HUD;
@property(nonatomic,copy)NSString *path;

@end
