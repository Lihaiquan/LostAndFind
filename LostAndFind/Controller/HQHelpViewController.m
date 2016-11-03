//
//  HQHelpViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/19.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQHelpViewController.h"
@interface HQHelpViewController ()

@end

@implementation HQHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *des = @"认领物品须经历一下步骤\n1.认真阅读认领界面的描述，捡到方可能会要求回报，回报金额不会超过200元。\n2.如果失主同意以上的回报，就开始认领，提供丢失物品的详细资料，发送给捡到者，发送的信息将会在捡到者的消息里显示，\n3.如果捡到者同意后，此时就可以在动态看到，就可以继续支付回报，填写邮递地址，此时捡到者就可以把丢的东西邮到丢者手中，如果丢者没收到，可申请退款。\n4.捡到者每上交一件物品，并成功被丢者收到，不仅可以获得需要的回报，并且会得到爱心值，爱心值可以提高用户的信誉度";
    
    UIFont *font =  [UIFont systemFontOfSize:15];
    CGRect rect = [des boundingRectWithSize:CGSizeMake( [UIScreen mainScreen].bounds.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:NULL];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 84, [UIScreen mainScreen].bounds.size.width - 20, rect.size.height)];
    label.font = font;
    label.text = des;
    label.numberOfLines = 0;
    label.textColor = UIColorFromRGB(0x666666);
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
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
