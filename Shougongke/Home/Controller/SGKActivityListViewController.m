//
//  SGKActivityViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKActivityListViewController.h"
#import "SGKTableViewControllerDataSource.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SGKActivityCell.h"
#import "Activity.h"
#import "DYNetworking+ActivityListHttpRequest.h"
#import "SGKBackToolBar.h"
#import "SGKActivityDetailViewController.h"
#import "SGKRefreshHeader.h"

static NSString *cellIdentifier = @"SGKActivityCell";

@interface SGKActivityListViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SGKTableViewControllerDataSource *dyTableViewControllerDataSource;
@property (nonatomic, strong) SGKBackToolBar *toolBar;

@end

@implementation SGKActivityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBar];
    [self.navigationItem setHidesBackButton:YES];
    [self setupTableView];
    [self addRefresh];
}

- (void)loadNewData{
    [DYNetworking getActivityControllerData:^(NSArray *activityArr) {
        self.dyTableViewControllerDataSource.items = activityArr;
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)addRefresh{
    self.tableView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self loadNewData];
    }];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(SGKActivityCell *cell, Activity *activity) {
        [cell configureCell:activity];
    };
    self.dyTableViewControllerDataSource =
    [[SGKTableViewControllerDataSource alloc]initWithItems:nil
                                           cellIdentifier:cellIdentifier
                                       configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.dyTableViewControllerDataSource;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.toolBar.mas_top);
    }];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.mas_equalTo(self.view);
    }];
}

#pragma mark - tableView

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(SGKActivityCell *cell) {
        [cell configureCell:self.dyTableViewControllerDataSource.items[indexPath.row]];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SGKActivityDetailViewController *viewController = [SGKActivityDetailViewController new];
    viewController.activity = self.dyTableViewControllerDataSource.items[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - getter and setter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[SGKActivityCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        [_tableView setTableFooterView:[[UIView alloc]init]];
    }
    return _tableView;
}

- (SGKBackToolBar *)toolBar{
    if (!_toolBar) {
        _toolBar = [[SGKBackToolBar alloc]initWithClick:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _toolBar;
}

@end
