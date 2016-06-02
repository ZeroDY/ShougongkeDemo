//
//  SGKTalentListViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/24.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKTalentListViewController.h"
#import "SGKTalentListCell.h"
#import "SGKTableViewControllerDataSource.h"
#import "SGKBackToolBar.h"
#import "DYNetworking+TalentListHttpRequest.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SGKRefreshHeader.h"
#import "SGKCourseDetailViewController.h"

static NSString *cellIdentifier = @"SGKTalentListCell";

@interface SGKTalentListViewController()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SGKTableViewControllerDataSource *dyTableViewControllerDataSource;
@property (nonatomic, strong) SGKBackToolBar *toolBar;

@end

@implementation SGKTalentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手工达人";
    [self.navigationItem setHidesBackButton:YES];//隐藏返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBar];
    [self setupTableView];
    [self addRefresh];
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
/**
 *	加载数据
 */
- (void)loadNewData{
    [DYNetworking getTalentListControllerData:^(NSArray *array) {
        self.dyTableViewControllerDataSource.items = array;
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}
/**
 *	下拉刷新
 */
- (void)addRefresh{
    self.tableView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self loadNewData];
    }];
}
/**
 *	通过SGKTableViewControllerDataSource配置 tableview
 */
- (void)setupTableView
{
    self.dyTableViewControllerDataSource =
    [[SGKTableViewControllerDataSource alloc]initWithItems:nil
                                            cellIdentifier:cellIdentifier
                                        configureCellBlock:^(SGKTalentListCell *cell, TalentListModel *talent) {
                                           [cell configureCell:talent clickBlock:^(NSInteger index) {
                                               SGKCourseDetailViewController *courseDetailVC = [SGKCourseDetailViewController new];
                                               courseDetailVC.cid = talent.list[index].hand_id;
                                               courseDetailVC.hidesBottomBarWhenPushed = YES;
                                               [self.navigationController pushViewController:courseDetailVC animated:YES];
                                           }];
                                       }];
    
    self.tableView.dataSource = self.dyTableViewControllerDataSource;
}

#pragma mark - tableViewdelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(SGKTalentListCell *cell) {
        [cell configureCell:self.dyTableViewControllerDataSource.items[indexPath.row] clickBlock:nil];
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    /**
     *	设置 cell 分割线最左对其
     */
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - getter and setter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[SGKTalentListCell class] forCellReuseIdentifier:cellIdentifier];
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
