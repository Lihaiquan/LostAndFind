//
//  HQSubmitLostInfoVC.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/24.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQSubmitLostInfoVC.h"
#import "SubmitView.h"

@interface HQSubmitLostInfoVC ()
@end

@implementation HQSubmitLostInfoVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    SubmitView *view = [[SubmitView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    view.type = SUBMIT_LOST_INFO;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
