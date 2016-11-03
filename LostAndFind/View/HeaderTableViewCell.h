//
//  HeaderTableViewCell.h
//  LostAndFind
//
//  Created by 李海权 on 2016/10/17.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderTableViewCellDelegate <NSObject>

- (void)tapItemsIndex:(NSInteger )index textTitle:(NSString *)titleText;

@end

@interface HeaderTableViewCell : UITableViewCell
@property (nonatomic,weak)id<HeaderTableViewCellDelegate>delegate;
+ (CGFloat)headerHeight;
@end
