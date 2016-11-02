//
//  JNFirstViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNFirstViewController.h"
#import "JNFirstCell.h"

@interface JNFirstViewController () 


@end

@implementation JNFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JNFirstCell" bundle:nil] forCellReuseIdentifier:@"JNFirstCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate && dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 93.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JNFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNFirstCell"];
    return cell;
}

@end
