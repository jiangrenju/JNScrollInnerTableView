//
//  JNTableViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNTableViewController.h"
#import "JNConst.h"

@interface JNTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation JNTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    _innerCanScroll = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCanScroll:) name:NotificationInnerCanScroll object:nil];
}

- (void)setViewFrame:(CGRect)frame{
    self.tableView.frame = frame;
}

- (void)receiveCanScroll:(NSNotification *)noti{
    _innerCanScroll = YES;
    self.tableView.showsVerticalScrollIndicator = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!_innerCanScroll){
        scrollView.contentOffset = CGPointZero;
        return;
    }
    
    if(scrollView.contentOffset.y <= 0){
        scrollView.contentOffset = CGPointZero;
        _innerCanScroll = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationOuterCanScroll object:nil userInfo:nil];
    }
}

#pragma mark - tableView delegate && dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
