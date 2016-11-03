//
//  HQFirstTableViewController.m
//  LostAndFind
//
//  Created by 李海权 on 2016/10/14.
//  Copyright © 2016年 李海权. All rights reserved.
//

#import "HQFirstTableViewController.h"
#import "HQTableViewCell.h"
#import "HeaderTableViewCell.h"
#import "TLCityPickerController.h"
#import "HQSelectView.h"

@interface HQFirstTableViewController ()<HeaderTableViewCellDelegate,TLCityPickerDelegate,HQSelectViewDelegate>

@end

@implementation HQFirstTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;

}

- (void)tapItemsIndex:(NSInteger )index textTitle:(NSString *)titleText
{

    NSString *className =@"HQKindViewController";
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.title = titleText;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = BarTintColor;
    NSDictionary *dict = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    [navBarView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSearchAction)]];
    navBarView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    navBarView.layer.cornerRadius = 5;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7.5, 15, 15)];
    imageView.image = [UIImage imageNamed:@"ap_titlebar_search_default@2x.png"];
    imageView.userInteractionEnabled = YES;
    [navBarView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 5, 200, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.userInteractionEnabled = YES;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    label.text = @"输入要找的物品、类别";
    [navBarView addSubview:label];
    self.navigationItem.titleView = navBarView;
    self.title = @"首页";
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"城市" style:UIBarButtonItemStylePlain target:self action:@selector(cityInterface)];
    self.navigationItem.leftBarButtonItem = leftItem;
    

    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    imageV.userInteractionEnabled = YES;
    imageV.image = [UIImage imageNamed:@"more-w@2x.png"];
    [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu)]];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:imageV];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)showMenu
{
    HQSelectView *selectView = [[HQSelectView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    [self.tabBarController.view addSubview:selectView];
    selectView.delegate = self;
}

- (void)selectAtRow:(NSInteger)row textTitle:(NSString *)text
{
    NSArray *controllers = @[@"HQSubmitViewController",@"HQSubmitLostInfoVC",@"MyLostStateViewController",@"HQHelpViewController"];
    NSString *className = controllers[row];
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.title = text;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tapSearchAction
{
     NSString *className =@"SearchViewController";
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cityInterface
{
    
    TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
    [cityPickerVC setDelegate:self];
    
//    cityPickerVC.loactionCityName = self.cityName;
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self.navigationController pushViewController:cityPickerVC animated:YES];
    
//    NSString *className =@"HQCityViewController";
//    UIViewController *vc = [[NSClassFromString(className) alloc] init];
//    vc.title = @"当前城市";
//    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController
                didSelectCity:(TLCity *)city
{

}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
{
    [cityPickerViewController.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [HeaderTableViewCell headerHeight];
    }
    return 95;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"reu"];
        if (!cell) {
            cell = [[HeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reu"];
            ((HeaderTableViewCell *)cell).delegate = self;
        }
    }else{
        [tableView registerNib:[UINib nibWithNibName:@"HQTableViewCell" bundle:nil] forCellReuseIdentifier:@"reuse"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 0.5;
    }
    return 40;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        UIView *view = [[UIView alloc] init];
        return view;
    }
    
    
    CGRect frameRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    UIView *backView = [[UIView alloc] initWithFrame:frameRect];
    backView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
    label.backgroundColor = [UIColor whiteColor];
    label.text=@"   最近发布";
    label.textColor = UIColorFromRGB(0x44444);
    label.font = [UIFont systemFontOfSize:15.0];
    [backView addSubview:label];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 4, 20)];
    leftView.backgroundColor = [UIColor redColor];
    [backView addSubview:leftView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 40-0.5,[UIScreen mainScreen].bounds.size.width , 0.5)];
    lineView.backgroundColor = UIColorFromRGB(0xdddddd);
    [backView addSubview:lineView];
    
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section !=0) {
        NSString *className =@"HQDetailViewController";
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        vc.title = @"回答问题认领";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
