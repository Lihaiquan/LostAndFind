//
//  SearchViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/18.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 35)];
    searchBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchBar];
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
