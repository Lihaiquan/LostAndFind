//
//  HQSelectView.h
//  LostAndFind
//
//  Created by 李海权 on 2016/10/19.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HQSelectViewDelegate <NSObject>

- (void)selectAtRow:(NSInteger)row textTitle:(NSString *)text;

@end

@interface HQSelectView : UIView
@property (nonatomic,weak)id<HQSelectViewDelegate>delegate;
- (void)appear;
- (void)disappear;
@end
