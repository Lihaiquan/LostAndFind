//
//  HQHeaderView.h
//  LostAndFind
//
//  Created by 李海权 on 2016/10/17.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HQHeaderViewDelegate  <NSObject>

- (void)tapViewWithIndex:(NSInteger)index titleText:(NSString *)text;

@end

@interface HQHeaderView : UIView
@property (nonatomic,weak)id<HQHeaderViewDelegate>delegate;
+ (CGFloat)headerHeight;
@end
