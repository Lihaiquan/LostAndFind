//
//  SubmitView.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/25.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "SubmitView.h"
#import "Masonry.h"

@interface SubmitView ()
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIButton *selectedBtn;

@end

@implementation SubmitView
#define Redius 5
-(void)tapScroll
{
    [_scrollView endEditing:YES];
}
- (void)handleButtonAction:(UIButton *)button
{
    if (_selectedBtn) {
        _selectedBtn.backgroundColor = [UIColor lightGrayColor];
    }
    button.backgroundColor = UIColorFromRGB(0xff5000);
    _selectedBtn = button;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [self layoutSubView];
    }
    return self;
}

- (void)layoutSubView
{
    _scrollView = [[UIScrollView alloc] init];
    [_scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScroll)]];
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.cornerRadius = Redius/2.0;
    [_scrollView addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:16.0];
    label.tag = 100;
    label.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:label];
    
    NSArray *titleArray = @[@"证件类",@"包",@"电子类",@"钥匙",@"收藏品",@"衣物类",@"纪念照",@"其他"];
    UIView *lastView = nil;
    for(int i = 0;i < 8; i ++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:button];
        if (lastView) {
            if (i == 4) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(([UIScreen mainScreen].bounds.size.width - 65)/4.0, 30));
                    make.topMargin.mas_equalTo(label).offset(80);
                    make.left.mas_equalTo(10);
                }];
            }else{
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(([UIScreen mainScreen].bounds.size.width - 65)/4.0, 30));
                    make.topMargin.mas_equalTo(lastView);
                    make.left.mas_equalTo(lastView).offset( ([UIScreen mainScreen].bounds.size.width - 65)/4.0+ 15);
                }];
            }
            
        }else{
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(([UIScreen mainScreen].bounds.size.width - 65)/4.0, 30));
                make.topMargin.mas_equalTo(label).offset(40);
                make.left.mas_equalTo(10);
            }];
        }
        
        
        lastView  = button;
        
    }
    
    UIView *indacatorView = [[UIView alloc] init];
    indacatorView.backgroundColor = [UIColor lightGrayColor];
    indacatorView.layer.cornerRadius = Redius/2.0;
    
    [_scrollView addSubview:indacatorView];
    
    UILabel *qLabel = [[UILabel alloc] init];
    qLabel.font = [UIFont systemFontOfSize:16.0];
    qLabel.tag = 101;
    qLabel.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:qLabel];
    
    
    NSArray *arr = @[@"年:",@"月:",@"日:"];
    UIView *yearTempView = nil;
    for (int i = 0;i < 3; i ++) {
        UILabel *yearlabel = [[UILabel alloc] init];
        yearlabel.font = [UIFont systemFontOfSize:16.0];
        yearlabel.text = arr[i];
        yearlabel.textColor = UIColorFromRGB(0x666666);
        [_scrollView addSubview:yearlabel];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = BarTintColor.CGColor;
        btn.layer.cornerRadius = 10;
        [_scrollView addSubview:btn];
        
        if (yearTempView) {
            [yearlabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(30, 30));
                make.topMargin.mas_equalTo(qLabel).offset(40);
                make.left.mas_equalTo(yearTempView).offset(75);
            }];
        }else{
            [yearlabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(30, 30));
                make.topMargin.mas_equalTo(qLabel).offset(40);
                make.left.mas_equalTo(10);
            }];
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 30));
            make.left.mas_equalTo(yearlabel).offset(25);
            make.topMargin.mas_equalTo(qLabel).offset(40);
        }];
        yearTempView = btn;
    }
    
    
    UIView *indaca = [[UIView alloc] init];
    indaca.backgroundColor = [UIColor lightGrayColor];
    indaca.layer.cornerRadius = Redius/2.0;
    [_scrollView addSubview:indaca];
    
    
    UILabel *qLa = [[UILabel alloc] init];
    qLa.font = [UIFont systemFontOfSize:16.0];
    qLa.tag = 102;
    qLa.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:qLa];
    
    UIView *localView = nil;
    NSArray *aArr = @[@"省:",@"市:"];
    for(int i = 0; i < 2 ; i ++){
        UILabel *slabel = [[UILabel alloc] init];
        slabel.font = [UIFont systemFontOfSize:16.0];
        slabel.text = aArr[i];
        slabel.textColor = UIColorFromRGB(0x666666);
        [_scrollView addSubview:slabel];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = BarTintColor.CGColor;
        btn.layer.cornerRadius = 10;
        [_scrollView addSubview:btn];
        
        if (localView) {
            [slabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(30, 30));
                make.topMargin.mas_equalTo(qLa).offset(40);
                make.left.mas_equalTo(localView).offset(75);
            }];
        }else{
            [slabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(30, 30));
                make.topMargin.mas_equalTo(qLa).offset(40);
                make.left.mas_equalTo(10);
            }];
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 30));
            make.left.mas_equalTo(slabel).offset(25);
            make.topMargin.mas_equalTo(qLa).offset(40);
        }];
        localView = btn;
        
    }
    
    UIView *indacator = [[UIView alloc] init];
    indacator.backgroundColor = [UIColor lightGrayColor];
    indacator.layer.cornerRadius = Redius/2.0;
    [_scrollView addSubview:indacator];
    
    UILabel *qesLabel = [[UILabel alloc] init];
    qesLabel.font = [UIFont systemFontOfSize:16.0];
    qesLabel.tag = 103;
    qesLabel.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:qesLabel];
    
    
    UITextView *textView = [[UITextView alloc] init];
    textView.layer.cornerRadius = 8;
    textView.layer.borderWidth = 0.5;
    textView.layer.borderColor =BarTintColor.CGColor;
    [_scrollView addSubview:textView];
    
    UIView *line0 = [[UIView alloc] init];
    line0.backgroundColor = [UIColor lightGrayColor];
    [_scrollView addSubview:line0];
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor lightGrayColor];
    [_scrollView addSubview:line1];
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.backgroundColor = [UIColor clearColor];
    leftLabel.font = [UIFont systemFontOfSize:16.0];
    leftLabel.text = @"悬赏额度";
    leftLabel.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.font = [UIFont systemFontOfSize:16.0];
    rightLabel.text = @"10元";
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.textColor = UIColorFromRGB(0x666666);
    [_scrollView addSubview:rightLabel];
    
    UIImageView *arrowImg = [[UIImageView alloc] init];
    arrowImg.image = [UIImage imageNamed:@"arrowImage@2x.png"];
    [_scrollView addSubview:arrowImg];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundImage:[UIImage imageNamed:@"矩形-19-拷贝-2@2x.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:button];
    
    UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    subBtn.backgroundColor = BarTintColor;
    subBtn.layer.cornerRadius = 5;
    subBtn.tag = 108;
    [subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scrollView addSubview:subBtn];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        // 让scrollview的contentSize随着内容的增多而变化
        make.bottom.mas_equalTo(subBtn.mas_bottom).offset(20);
    }];
    
    
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Redius, Redius));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(label).offset(15);
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 , 35));
        make.topMargin.mas_equalTo(7);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    
    [indacatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Redius, Redius));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(qLabel).offset(15);
    }];
    [qLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 , 35));
        make.topMargin.mas_equalTo(lastView).offset(35);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    
    
    [indaca mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Redius, Redius));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(qLa).offset(15);
    }];
    
    [qLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 , 35));
        make.topMargin.mas_equalTo(yearTempView).offset(35);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    
    
    [indacator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Redius, Redius));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(qesLabel).offset(15);
    }];
    
    [qesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 , 35));
        make.topMargin.mas_equalTo(localView).offset(35);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 40));
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.topMargin.mas_equalTo(qesLabel).offset(40);
    }];
    
    [line0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.topMargin.mas_equalTo(textView).offset(45);
    }];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width/2.0, 30));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(line0).offset(5);
    }];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width/2.0 - 30, 30));
        make.left.mas_equalTo(leftLabel).offset([UIScreen mainScreen].bounds.size.width/2.0);
        make.topMargin.mas_equalTo(line0).offset(5);
    }];
    
    [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 17));
        make.right.mas_equalTo(-5);
        make.topMargin.mas_equalTo(line0).offset(10);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5));
        make.left.mas_equalTo(0);
        make.topMargin.mas_equalTo(rightLabel).offset(37);
    }];
    
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.mas_equalTo(10);
        make.topMargin.mas_equalTo(line1).offset(10);
    }];
    
    [subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 35));
        make.left.mas_equalTo(20);
        make.topMargin.mas_equalTo(button).offset(85);
    }];
    
}

- (void)setType:(SubmitType)type
{
    _type = type;
    UILabel *qlabel0 = [_scrollView viewWithTag:100];
    UILabel *qlabel1 = [_scrollView viewWithTag:101];
    UILabel *qlabel2 = [_scrollView viewWithTag:102];
    UILabel *qlabel3 = [_scrollView viewWithTag:103];
    UIButton *subBtn =[_scrollView viewWithTag:108];
    if (type == SUBMIT_THIGS) {
        qlabel0 .text = @"请选择您要上交的物品类别？";;
        qlabel1.text =  @"请您选择捡到物品的时间？";
        qlabel2.text =  @"请您选择捡到物品的地点?";
        qlabel3.text =  @"简要描述物品的信息？";
        [subBtn setTitle:@"提交物品" forState:UIControlStateNormal];

;
    }else{
        qlabel0 .text = @"请选择您要寻找的物品类别？";
        qlabel1.text =  @"请您选择丢失物品的时间？";
        qlabel2.text =  @"请您选择丢失物品的地点?";
        qlabel3.text =  @"简要描述丢失物品的信息？";
        [subBtn setTitle:@"发布信息" forState:UIControlStateNormal];

    }
}


- (void)keyBoardWillShow:(NSNotification *)note{
    self.transform = CGAffineTransformIdentity;
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat ty =  rect.size.height;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstRes= [keyWindow performSelector:@selector(firstResponder)];
    CGFloat y =  CGRectGetMaxY(firstRes.frame);
    CGFloat dBottom = self.bounds.size.height - y -firstRes.frame.size.height;
    if (dBottom < ty) {
        [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
            self.transform =  CGAffineTransformMakeTranslation(0, ( dBottom-ty + 10));
        }];
    }
    
    
}
#pragma mark 键盘即将退出
- (void)keyBoardWillHide:(NSNotification *)note{
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
