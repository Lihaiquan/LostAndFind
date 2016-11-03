//
//  HeaderTableViewCell.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/17.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import "HQHeaderView.h"

@interface HeaderTableViewCell ()<HQHeaderViewDelegate>
@property(nonatomic,strong) HQHeaderView *view;
@end

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (CGFloat)headerHeight
{
    return [HQHeaderView headerHeight] + 12;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _view =  [[HQHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _view.userInteractionEnabled = YES;
        _view.delegate = self;
        _view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_view];
        
        UIView *sView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_view.frame),[UIScreen mainScreen].bounds.size.width, 12)];
        sView.backgroundColor = UIColorFromRGB(0xf0f0f0);
        [self addSubview:sView];
    }
    return self;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    return [super hitTest:point withEvent:event];
}

- (void)tapViewWithIndex:(NSInteger)index titleText:(NSString *)text
{
    if ([self.delegate respondsToSelector:@selector(tapItemsIndex:textTitle:)]) {
        [self.delegate tapItemsIndex:index textTitle:text];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
