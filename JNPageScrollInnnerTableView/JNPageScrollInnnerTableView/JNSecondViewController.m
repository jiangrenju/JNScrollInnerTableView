//
//  JNSecondViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNSecondViewController.h"
#import "JNSecondCell.h"

@interface JNSecondViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation JNSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JNSecondCell" bundle:nil] forCellReuseIdentifier:@"JNSecondCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate && dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 186;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JNSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNSecondCell"];
    return cell;
}

@end
