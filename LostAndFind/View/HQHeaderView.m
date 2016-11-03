//
//  HQHeaderView.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/17.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQHeaderView.h"

#define COUNT 4


@implementation HQHeaderView
static int line = 2;
- (id)initWithFrame:(CGRect)frame
{
   self =   [super initWithFrame:CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width, line* [UIScreen mainScreen].bounds.size.width/COUNT)];
    if (self) {
        [self layoutViewSubView];
    
    }
    return self;
}


- (void)layoutViewSubView
{
    NSArray *titleArr = @[@"证件类",@"包",@"电子类",@"钥匙",@"收藏品",@"衣物类",@"纪念照",@"其他"];
    NSArray *imgArr = @[@"bank@2x.png",@"bookmark@2x.png",@"online@2x.png",@"alipay_msp_key_info@2x.png",@"star_highlight@2x.png",@"bonus_24.png",@"publishHelp@3x.png",@"document@2x.png"];
  CGFloat labelHeight = 20;
  CGFloat width =   [UIScreen mainScreen].bounds.size.width/COUNT;
  CGRect rect = CGRectMake(0, 0, 0, 0);
    for (int i = 0; i < 8; i ++) {
        switch (i) {
            case 0:
                rect = CGRectMake( 5 , 5, width - 10, width - labelHeight - 10);
                break;
            case 1:
                     rect = CGRectMake(13  ,  19, width - 26, width - labelHeight - 38);
                break;

            case 4:
                     rect = CGRectMake(18 , 15, width - 36, width - labelHeight - 30);
                break;
            case 5:
                     rect = CGRectMake(0 + 15 , 10, width - 30, width - labelHeight - 20);
                break;
                default:
                  rect = CGRectMake(0 + 10 +labelHeight/2  , 10 , width  - 20 - labelHeight , width - labelHeight -20 );
                break;
        }
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0 + (i%COUNT)*width ,  (i/COUNT) *width  , width, width)];
        backView.tag = 100 + i;
        [backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackView:)]];
        
//        CGFloat r = (arc4random()%255)/255.0;
//        CGFloat g = (arc4random()%255)/255.0;
//        CGFloat b = (arc4random()%255)/255.0;
//        
//        backView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];

        [self addSubview:backView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
        imageView.image = [UIImage imageNamed:imgArr[i]];
        imageView.userInteractionEnabled = YES;
        [backView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0 , width - labelHeight -5,width, labelHeight)];
        label.userInteractionEnabled = YES;
        label.text = titleArr[i];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:label];
        
    }
}


- (void)tapBackView:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(tapViewWithIndex:titleText:)]) {
        NSInteger index = tap.view.tag - 100;
        NSArray *titleArr = @[@"证件类",@"包",@"电子类",@"钥匙",@"收藏品",@"衣物类",@"纪念照",@"其他"];

        [_delegate tapViewWithIndex:index titleText: titleArr[index]];
    }
}

+ (CGFloat )headerHeight
{
    return line* [UIScreen mainScreen].bounds.size.width/COUNT ;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
