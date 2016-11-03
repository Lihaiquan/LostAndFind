//
//  SubmitView.h
//  LostAndFind
//
//  Created by 李海权 on 2016/10/25.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
 SUBMIT_THIGS,
 SUBMIT_LOST_INFO,
} SubmitType;

@interface SubmitView : UIView
@property (nonatomic,assign)SubmitType type;
@end
