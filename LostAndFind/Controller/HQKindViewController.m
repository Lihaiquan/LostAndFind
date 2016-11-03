//
//  HQKindViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/18.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQKindViewController.h"

@interface HQKindViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HQKindViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    UISegmentedControl *segMent = [[UISegmentedControl alloc] initWithItems:@[@"待寻找",@"待认领"]];
    segMent.frame = CGRectMake(0, 10, 120, 30);
    segMent.layer.cornerRadius = 8;
    segMent.selectedSegmentIndex = 0;
    [segMent setTintColor:[UIColor whiteColor]];
    [segMent addTarget:self action:@selector(segMentAction) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segMent;
}

- (void)segMentAction
{
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    [tableView registerNib:[UINib nibWithNibName:@"HQTableViewCell" bundle:nil] forCellReuseIdentifier:@"reuse"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
