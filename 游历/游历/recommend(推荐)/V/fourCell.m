//
//  fourCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/17.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "fourCell.h"
#import "PlaceMadel.h"
//横向间隙
#define WIDE  10

//纵向间隙
#define HIGHT 20

@implementation fourCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellAccessoryNone;
//        每个图片的宽度
        CGFloat  wideImage = (SCREEN_WIDHT - 3*WIDE)/2.0;
//        每个图片的高度
        CGFloat  higthImage = (250 - 3 *HIGHT)/2.0;
        UIImageView *imageViaw;
        
         int n =5;
         int m = 10;
        for (int i = 0 ; i < 2; i ++) {
            for ( int j = 0 ; j < 2; j ++) {
                
#pragma mark -- 图片
                
                
                
                imageViaw = [[UIImageView alloc]init];
                imageViaw.tag = n;
                n ++;
                self.PlaceImage = imageViaw;
                imageViaw.frame = CGRectMake(((wideImage + WIDE) * i + WIDE), ((higthImage +HIGHT) * j + HIGHT), wideImage, higthImage);
                
             
                [self.contentView addSubview:imageViaw];
                
                UIView *view = [[UIView alloc]init];
                view.frame = CGRectMake(0, higthImage -25, wideImage, 25);
                view.backgroundColor = [UIColor grayColor];
                view.alpha = 0.8;
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changePage:)];
                tap.numberOfTouchesRequired = 1;
                tap.numberOfTapsRequired = 1;
                imageViaw.userInteractionEnabled = YES;
                [imageViaw addGestureRecognizer:tap];
                
                [imageViaw addSubview:view];
                
                
                
                UIImageView *imageV = [[UIImageView alloc]init];
                imageV.frame = CGRectMake(20, 2, 20, 20);
                UIImage *image = [UIImage imageNamed:@"poipoi@2x.png"];
                imageV.image = image;
                [view addSubview:imageV];
                
#pragma mark -- 标题

                UILabel *labelTile = [[UILabel alloc]init];
                labelTile.tag = m;
                m ++;
                self.titleLable = labelTile;
                labelTile.frame = CGRectMake(45, 2, 100, 20);
                labelTile.textColor = [UIColor whiteColor];
                labelTile.font = [UIFont boldSystemFontOfSize:12];
                [view addSubview:labelTile];
                
            }
                       
        }
    }
    return self;
}

-(void)updataApp:(NSArray *)app
{
    
    
    
//    self.titleLable.text = app.title;
    [app enumerateObjectsUsingBlock:^(PlaceMadel *obj, NSUInteger idx, BOOL *stop) {
        
        PlaceMadel *palce = app[idx];
        UIImageView *imageV = (UIImageView *)[self.contentView viewWithTag:(int)(idx+5)];
        UILabel *label = (UILabel *)[self.contentView viewWithTag:(idx +10)];
        label.text = palce.label;
        NSString *path = palce.photo;
        NSURL *url = [NSURL URLWithString:path];
        [imageV sd_setImageWithURL:url];
        
    }];
    
    
    
}
-(void)changePage:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    self.blck((int)imageView.tag);

    
    
    
}

@end
