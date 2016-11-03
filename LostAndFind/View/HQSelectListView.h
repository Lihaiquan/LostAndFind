//
//  HQSelectListView.h
//  LostAndFind
//
//  Created by 李海权 on 2016/10/19.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HQSelectListViewDelegate <NSObject>

- (void)didSelectedRow:(NSInteger)row titleText:(NSString *)text;

@end

@protocol HQSelectListViewDataSource <NSObject>
/*
 row的行数
 */
- (NSInteger)numberOfRow;
@optional;
/*
 设置菜单的文字
 */
- (NSString *)textAtRow:(NSInteger)row;

/*
   设置菜单的图标
 */

- (UIImage *)lmageAtRow:(NSInteger)row;

@end

@interface HQSelectListView : UIView
@property (nonatomic,weak)id<HQSelectListViewDelegate>delegate;
@property (nonatomic,weak)id<HQSelectListViewDataSource>dataSource;
- (void)appear;
- (void)disappear;
@end
