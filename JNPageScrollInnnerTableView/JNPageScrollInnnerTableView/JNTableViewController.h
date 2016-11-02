//
//  JNTableViewController.h
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNBaseViewController.h"

@interface JNTableViewController : JNBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL innerCanScroll;

- (void)setViewFrame:(CGRect)frame;

@end
