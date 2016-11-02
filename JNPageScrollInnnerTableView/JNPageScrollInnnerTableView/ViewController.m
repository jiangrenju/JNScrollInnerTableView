//
//  ViewController.m
//  JNPageScrollInnnerTableView
//
//  Created by jiangrenju on 2016/10/31.
//  Copyright © 2016年 jiang. All rights reserved.
//

#import "ViewController.h"
#import "JNRecognizeTableView.h"
#import "JNTableViewCell.h"
#import "JNMainViewController.h"
#import "JNConst.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
{
    CGFloat _headHeight;
    BOOL _outerCanScroll;
}
@property (nonatomic, strong) JNRecognizeTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jnNavBarView.backgroundColor = [UIColor whiteColor];
    self.jnNavBarView.alpha = 0;
    
    _headHeight = 200;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _outerCanScroll = YES;
    
    [self initSubviews];
    
    [self.view bringSubviewToFront:self.jnNavBarView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOuterCanScroll:) name:NotificationOuterCanScroll object:nil];
}

- (void)receiveOuterCanScroll:(NSNotification *)noti{
    _outerCanScroll = YES;
    self.tableView.showsVerticalScrollIndicator = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    //[self pushToMainController];
}

- (void)pushToMainController{
    JNMainViewController *mainVC = [[JNMainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
}

- (void)initSubviews{
    if(!_tableView){
        self.tableView = [[JNRecognizeTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.bounces = YES;
        self.tableView.showsVerticalScrollIndicator = YES;
        [self.view addSubview:self.tableView];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, _headHeight)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:headView.bounds];
        imageView.image = [UIImage imageNamed:@"sampleee.jpg"];
        [headView addSubview:imageView];
        self.tableView.tableHeaderView = headView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - scroll delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!_outerCanScroll){
        
        scrollView.contentOffset = CGPointMake(0, (_headHeight - self.jnNavBarView.bounds.size.height));
        
        return;
    }
    
    if(scrollView.contentOffset.y >= (_headHeight - self.jnNavBarView.bounds.size.height)){
        _outerCanScroll = NO;
        scrollView.contentOffset = CGPointMake(0, (_headHeight - self.jnNavBarView.bounds.size.height));
        scrollView.showsVerticalScrollIndicator = NO;

        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationInnerCanScroll object:nil userInfo:nil];
    }
    
    if(scrollView.contentOffset.y <= 0){
        UIView *imageView = [self.tableView.tableHeaderView.subviews firstObject];
        imageView.frame = CGRectMake(scrollView.contentOffset.y/2, scrollView.contentOffset.y, ScreenWidth-scrollView.contentOffset.y, _headHeight-scrollView.contentOffset.y);
    }
    self.jnNavBarView.alpha = scrollView.contentOffset.y/(_headHeight - self.jnNavBarView.bounds.size.height);
}

#pragma mark - tableView delegate && dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScreenHeight-self.jnNavBarView.bounds.size.height;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JNTableViewCell *cell = [[JNTableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor orangeColor];
    [self createPageViewWithSuperView:cell];
    return cell;
}

#pragma mark - private method

- (void)createPageViewWithSuperView:(UIView *)view{
    JNMainViewController *main = [[JNMainViewController alloc] init];
    main.view.frame = view.bounds;
    [view addSubview:main.view];
    
    [self addChildViewController:main];
}


@end
