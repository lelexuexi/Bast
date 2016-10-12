//
//  TableViewController.m
//  GreetingCard
//
//  Created by ios004 on 16/10/12.
//  Copyright © 2016年 zsb2c. All rights reserved.
//

#import "TabBarController.h"

#import "HomeVC.h"

#import "BastNavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeVC * homeVC = [[HomeVC alloc]init];
    
    BastNavigationController * homeNav = [[BastNavigationController alloc]initWithRootViewController:homeVC];

    
    //    UITabBarController * tabBarController = [[UITabBarController alloc]init];
    self.viewControllers = @[homeNav];
    
    homeNav.tabBarItem.title = @"首页";

    homeVC.view.backgroundColor = [UIColor whiteColor];

    
    
    //    self.tabBar.translucent = NO;
    [UITabBar appearance].translucent = NO ;
    //    [[UITabBar appearance] setBackgroundColor:[UIColor redColor]];
    homeVC.navigationController.navigationBar.translucent = NO;
    
    
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"首页s" image: [UIImage imageNamed:@""] selectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]; //选择图片颜色模式需要设置

    homeNav.tabBarItem= tabBarItem1 ;

    [self NavColor];
}



//修改程序中所有的显示的navigationbar的颜色，字体
- (void)NavColor
{
    
    
    
    //改变uitabbaritem 字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor orangeColor] } forState:UIControlStateSelected];
    
    

    
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //    if ([[[UIDevice currentDevice] systemVersion] floatValue] != 7.0)
    //    {
    //        // 2.不是iOS7
    //        // 2.1.设置bar背景
    //        [bar setBackgroundImage:[UIImage imageNamed:@"nav.png"] forBarMetrics:UIBarMetricsDefault];
    //        // 2.2.设置状态栏为黑色
    //        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //    }
    
    [bar setBackgroundColor:[UIColor orangeColor] ];
    //    [bar setBackgroundColor:[UIColor colorWithRed:210/255.0 green:6/255.0 blue:59/255.0 alpha:1.0]];
    bar.barStyle = UIBarStyleBlack;
    
    //设置显示的颜色
    bar.barTintColor = [UIColor orangeColor] ;
    //    bar.barTintColor = [UIColor colorWithRed:210/255.0 green:6/255.0 blue:59/255.0 alpha:1.0];
    
    //设置字体颜色
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //或者用这个都行
    //    [bar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    
    
    //设置NavigationBar背景颜色
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    //    //@{}代表Dictionary
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
