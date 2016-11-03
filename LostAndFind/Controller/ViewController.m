//
//  ViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/14.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = BarTintColor;
    NSDictionary *dict = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    self.navigationController.navigationBar.titleTextAttributes = dict;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
