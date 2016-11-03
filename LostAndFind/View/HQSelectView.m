//
//  HQSelectView.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/19.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQSelectView.h"
#import "HQSelectListView.h"

@interface HQSelectView ()<HQSelectListViewDelegate,HQSelectListViewDataSource>
@property (nonatomic,strong)HQSelectListView *selectListView;
@property (nonatomic,strong)NSArray *textArr;
@property (nonatomic,strong)NSArray *imageArr;
@end

@implementation HQSelectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap =    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
        _textArr = @[@"上交物品",@"丢者求助",@"物流状态",@"帮助"];
        
        self.backgroundColor = [UIColor clearColor];
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.3;
        [self addSubview:backView];
        [backView addGestureRecognizer:tap];

        _selectListView = [[HQSelectListView alloc] initWithFrame:CGRectMake(frame.size.width - 120 - 10, 64, 120, 0)];
        _selectListView.delegate = self;
        _selectListView.dataSource = self;
        [self addSubview:_selectListView];
    }
    return self;
}

- (void)hiddenView
{
    [self removeFromSuperview];
}

- (void)appear
{
    
}
- (void)disappear
{
 
}


- (void)didSelectedRow:(NSInteger)row titleText:(NSString *)text
{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([_delegate respondsToSelector:@selector(selectAtRow:textTitle:)]) {
            [_delegate selectAtRow:row textTitle:text];
        }
    });
   

}
/*
 row的行数
 */
- (NSInteger)numberOfRow
{
    return _textArr.count;
}
/*
 设置菜单的文字
 */
- (NSString *)textAtRow:(NSInteger)row
{
    return _textArr[row];
}

/*
 设置菜单的图标
 */

//- (UIImage *)lmageAtRow:(NSInteger)row
//{
//
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
