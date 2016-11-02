//
//  JNMainViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/11/2.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "JNMainViewController.h"
#import <WMPageController/WMPageController.h>
#import "JNFirstViewController.h"
#import "JNSecondViewController.h"
#import "JNConst.h"

@interface JNMainViewController () <WMPageControllerDelegate>
{
    BOOL _innerCanScroll;
    WMPageController *_pageVC;
}
@end

@implementation JNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray <Class>*array = @[[JNFirstViewController class],[JNSecondViewController class],[JNFirstViewController class], [JNSecondViewController class]];
    NSArray <NSString *>*titles = @[@"头条",@"视频",@"体育",@"科技"];
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:array andTheirTitles:titles];
    pageVC.menuHeight = 44.0;
    pageVC.titleSizeSelected = 17;
    pageVC.pageAnimatable = YES;
    pageVC.delegate = self;
    pageVC.view.frame = self.view.bounds;
    pageVC.viewFrame = self.view.bounds;
    pageVC.menuViewStyle = WMMenuViewStyleLine;
    pageVC.titleColorSelected = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageVC.titleColorNormal = [UIColor blackColor];
    pageVC.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
//    pageVC.itemsWidths = @[@(70),@(100),@(70)]; // 这里可以设置不同的宽度
    pageVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    [self.view addSubview:pageVC.view];
    [self addChildViewController:pageVC];
    _pageVC = pageVC;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCanScroll:) name:NotificationInnerCanScroll object:nil];
}

- (void)receiveCanScroll:(NSNotification *)noti{
    _innerCanScroll = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pageController delegate

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    JNTableViewController *controller = (JNTableViewController *)viewController;
    controller.innerCanScroll = _innerCanScroll;
    [controller setViewFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-44.0)];
}


@end
