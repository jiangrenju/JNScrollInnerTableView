//
//  JNBaseViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNBaseViewController.h"
#import "JNConst.h"

@interface JNBaseViewController ()

@end

@implementation JNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jnNavBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    [self.view addSubview:self.jnNavBarView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-50, 27, 100, 30)];
    titleLabel.text = @"MrJN";
    titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.jnNavBarView addSubview:titleLabel];
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
