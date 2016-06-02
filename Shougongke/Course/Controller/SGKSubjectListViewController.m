//
//  SGKSublectListViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKSubjectListViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SGKCourseVideoSubCell.h"
#import "SGKTableViewControllerDataSource.h"
#import "DYNetworking+CourseSubjectListHttpRequest.h"
#import "SGKSubjectDetailViewController.h"
#import "SGKRefreshHeader.h"


static NSString *courseVideoSubCellIdentifier = @"SGKCourseVideoSubCell";
@interface SGKSubjectListViewController ()<UITableViewDelegate>

@property (nonatomic, copy) NSArray *topicArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SGKTableViewControllerDataSource *dyTableViewControllerDataSource;

@end

@implementation SGKSubjectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setupTableView];
    [self addRefresh];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
/**
 *	获取数据
 */
- (void)getSubjectListData{
    [DYNetworking getCourseSubjectListDataTageid:self.tag_id
                                           block:^(NSArray *array) {
                                               self.topicArray = array;
                                               self.dyTableViewControllerDataSource.items = array;
                                               [self.tableView.mj_header endRefreshing];
                                               [self.tableView reloadData];
                                           } fail:^(NSError *error) {
                                               [self.tableView.mj_header endRefreshing];
                                           }];
}
/**
 *	下拉刷新
 */
- (void)addRefresh{
    self.tableView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self getSubjectListData];
    }];
}
/**
 *	SGKTableViewControllerDataSource配置 tableview
 */
- (void)setupTableView
{
    self.dyTableViewControllerDataSource =
    [[SGKTableViewControllerDataSource alloc]initWithItems:self.topicArray
                                            cellIdentifier:courseVideoSubCellIdentifier
                                        configureCellBlock:^(SGKCourseVideoSubCell *cell, HomeTopic *topic) {
                                            [cell configureCellWithTopic:topic];
                                        }];
    
    self.tableView.dataSource = self.dyTableViewControllerDataSource;
}

#pragma mark - tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:courseVideoSubCellIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(SGKCourseVideoSubCell *cell) {
                                           [cell configureCellWithTopic:self.topicArray[indexPath.row]];
                                       }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTopic *topic = self.topicArray[indexPath.row];
    SGKSubjectDetailViewController *viewController = [SGKSubjectDetailViewController new];
    viewController.url = topic.mob_h5_url;
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getter and setter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        [_tableView registerClass:[SGKCourseVideoSubCell class] forCellReuseIdentifier:courseVideoSubCellIdentifier];
        _tableView.delegate = self;
        [_tableView setTableFooterView:[[UIView alloc]init]];
        [_tableView setSeparatorColor:[UIColor clearColor]];
    }
    return _tableView;
}

@end
