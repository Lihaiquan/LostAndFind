//
//  HQTableViewCell.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/14.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQTableViewCell.h"

@implementation HQTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _imgView.layer.borderColor =UIColorFromRGB(0xf0f0f0).CGColor;
    _imgView.layer.borderWidth = 0.5;
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
