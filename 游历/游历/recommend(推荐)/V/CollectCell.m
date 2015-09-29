//
//  CollectCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/27.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "CollectCell.h"

@implementation CollectCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)myBtn:(id)sender {
    
    self.block();
}
@end
