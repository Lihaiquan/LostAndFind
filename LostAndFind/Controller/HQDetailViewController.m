//
//  HQDetailViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/14.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQDetailViewController.h"

@interface HQDetailViewController (){
    CGFloat old_y;
}
@property (nonatomic,strong)UITextView *textView;

@end

@implementation HQDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xf0f0f0);
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"帮助" style:UIBarButtonItemStylePlain target:self action:@selector(helpDetail)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    NSString *des = @"本物品在2015年10月12日左右，在回龙观东大街捡到，对方要求回报金额10元,如果有人丢失请迅速认领，认领方式需要回答捡到方的问题，通过后方可按步骤领取！希望您能找回您的物品！";
    UIFont *font =  [UIFont systemFontOfSize:15];
    
    CGRect rect = [des boundingRectWithSize:CGSizeMake( [UIScreen mainScreen].bounds.size.width - 20, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:NULL];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(5, 74, [UIScreen mainScreen].bounds.size.width - 10, rect.size.height + 20)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 84, [UIScreen mainScreen].bounds.size.width - 20, rect.size.height)];
    label.font = font;
    label.text = des;
    label.numberOfLines = 0;
    label.textColor = UIColorFromRGB(0x666666);
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    
    NSDictionary *qDic = @{
                           @"certificate":@{
                                   @"qestion1":@"你的姓名？",
                                   @"question2":@"你丢失的证件尾号6位？",
                                   @"quetion3":@"请详细描述丢失物件信息？",
                                   },
                           @"others":@{
                                   @"question2": @"描述您丢失的东西的详细信息方便我们快速查找？",
                                   },
                           
                           };
    

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20,  [UIScreen mainScreen].bounds.size.height - 35-10, [UIScreen mainScreen].bounds.size.width - 40, 35);
    button.layer.cornerRadius = 8;
    button.backgroundColor = BarTintColor;
    [button setTitle:@"发送给捡到者" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleAnswer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CGRect frame =  CGRectMake(20, CGRectGetMaxY(whiteView.frame), [UIScreen mainScreen].bounds.size.width - 40, 35);
    CGFloat y = CGRectGetMaxY(frame);
    CGFloat textViewHeight = 60;
    
    BOOL isZhengjian = arc4random()%2;
    NSDictionary *qestionDic;
    if (isZhengjian) {
        qestionDic = qDic[@"certificate"];
    }else{
        qestionDic = qDic[@"others"];
        textViewHeight = 200;
        
    }
    
    int i = 0;
    for (NSString *key in qestionDic) {
        NSString *q = qestionDic[key];
        UIFont* font  = [UIFont systemFontOfSize:15];
        CGRect rect = [q boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:NULL];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, y + old_y * i + (textViewHeight + 10 )* i  , [UIScreen mainScreen].bounds.size.width - 20, rect.size.height)];
        label.font = font;
        label.text = q;
        label.numberOfLines = 0;
        label.textColor = [UIColor redColor];
        label.backgroundColor = [UIColor clearColor];
        [self.view addSubview:label];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(label.frame) + 5,[UIScreen mainScreen].bounds.size.width - 10 , textViewHeight)];
        textView.font = font;
        textView.tag = 100 + i;
        textView.textColor =  UIColorFromRGB(0x666666);
        textView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:textView];
        old_y = rect.size.height;
        i ++;
        
    }

    
    
    
    // Do any additional setup after loading the view.
}

- (void)handleAnswer:(UIButton *)button
{

    if ([button.currentTitle isEqualToString:@"我要进入领取流程"]) {
            }  else{
    
    }
  
}

- (void)helpDetail
{
     NSString *className = @"HQHelpViewController";
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.title = @"帮助";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyBoardWillShow:(NSNotification *)note{
    self.view.transform = CGAffineTransformIdentity;
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat ty =  rect.size.height;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstRes= [keyWindow performSelector:@selector(firstResponder)];
    CGFloat y =  CGRectGetMaxY(firstRes.frame);
    CGFloat dBottom = [UIScreen mainScreen].bounds.size.height - y - firstRes.frame.size.height;
    if (dBottom < ty) {
        [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
            self.view.transform =  CGAffineTransformMakeTranslation(0, (dBottom -ty ));
        }];
    }
  
   
}
#pragma mark 键盘即将退出
- (void)keyBoardWillHide:(NSNotification *)note{
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
         self.view.transform = CGAffineTransformIdentity;

    }];
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
