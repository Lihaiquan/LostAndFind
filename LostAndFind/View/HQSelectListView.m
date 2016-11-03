//
//  HQSelectListView.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/19.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQSelectListView.h"

#define ARROW_MARGIN_LEFT 10
#define ARROW_WIDTH 10
#define ROW_HEIGHT 40
struct {
    unsigned int didSelectedRow:1;
    unsigned int  textAtRow:1;
    unsigned int lmageAtRow:1;
    unsigned int numberOfRow:1;
} _delegateDataSourceFlags;

@interface HQSelectListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HQSelectListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (1.732050 /2.0) *ARROW_WIDTH , frame.size.width, frame.size.height - (1.732050 /2.0) *ARROW_WIDTH)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)appear
{
  
}
- (void)disappear
{

}

- (void)setDelegate:(id<HQSelectListViewDelegate>)delegate
{
    _delegate = delegate;
    _delegateDataSourceFlags.didSelectedRow = [_delegate respondsToSelector:@selector(didSelectedRow:titleText:)];
}

- (void)setDataSource:(id<HQSelectListViewDataSource>)dataSource
{
    _dataSource = dataSource;
    _delegateDataSourceFlags.textAtRow = [_dataSource respondsToSelector:@selector(textAtRow:)];
    _delegateDataSourceFlags.lmageAtRow = [_dataSource respondsToSelector:@selector(lmageAtRow:)];
    _delegateDataSourceFlags.numberOfRow = [_dataSource respondsToSelector:@selector(numberOfRow)];
   
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGRect frameSize = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextSetRGBStrokeColor(context,1.0,1.0,1.0,1.0);
    CGContextAddLineToPoint (context, 0, (1.732050 /2.0) *ARROW_WIDTH );//下平行线
    CGContextAddLineToPoint (context, frameSize.size.width - ARROW_MARGIN_LEFT - ARROW_WIDTH,(1.732050 /2.0) *ARROW_WIDTH );//上平行线
    CGContextAddLineToPoint (context, frameSize.size.width - ARROW_MARGIN_LEFT - ARROW_WIDTH/2, 0);
    CGContextAddLineToPoint (context, frameSize.size.width - ARROW_MARGIN_LEFT ,(1.732050 /2.0) *ARROW_WIDTH );//上平行线
    CGContextAddLineToPoint (context, frameSize.size.width  ,(1.732050 /2.0) *ARROW_WIDTH );//上平行线
    CGContextAddLineToPoint (context, frameSize.size.width, frameSize.size.height );
    CGContextAddLineToPoint (context, 0, frameSize.size.height);//下平行线
    CGContextSetLineWidth(context,0.1);
    CGContextClosePath(context);
    [[UIColor whiteColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_delegateDataSourceFlags.numberOfRow) {
        CGRect frame = self.frame;
        NSInteger number = [_dataSource numberOfRow];
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, ROW_HEIGHT *number + (1.732050 /2.0) *ARROW_WIDTH);
        tableView.frame = CGRectMake(0,  (1.732050 /2.0) *ARROW_WIDTH, frame.size.width, ROW_HEIGHT *number);
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_delegateDataSourceFlags.numberOfRow) {
        return [_dataSource numberOfRow];
    }else{
      return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (_delegateDataSourceFlags.textAtRow) {
        cell.textLabel.text = [_dataSource textAtRow:indexPath.row];
    }
    
    if (_delegateDataSourceFlags.lmageAtRow) {
        cell.imageView.image = [_dataSource lmageAtRow:indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return ROW_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegateDataSourceFlags.didSelectedRow) {
        if (_delegateDataSourceFlags.textAtRow) {
              [_delegate didSelectedRow:indexPath.row titleText:[_dataSource textAtRow:indexPath.row]];
        }else{
              [_delegate didSelectedRow:indexPath.row titleText:@""];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
