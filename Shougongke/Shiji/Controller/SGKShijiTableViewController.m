//
//  SGKShijiTableViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiTableViewController.h"
#import "DYNetworking+ShijiVCHttpRequest.h"
#import "ShijiVCModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SGKShijiTableHotCell.h"
#import "SGKShijiTableBestCell.h"
#import "SGKShijiTableTopicBestCell.h"
#import "SGKCourseVideoSubCell.h"
#import "SGKShijiHeaderView.h"
#import "SGKSubjectDetailViewController.h"

static NSString *hotCellIdentifier = @"SGKShijiTableHotCell";
static NSString *bestCellIdentifier = @"SGKShijiTableBestCell";
static NSString *topicBestCellIdentifier = @"SGKShijiTableTopicBestCell";
static NSString *topicCellIdentifier = @"SGKCourseVideoSubCell";

@interface SGKShijiTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ShijiVCModel *shijiModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SGKShijiHeaderView *bestHeaderView;
@property (nonatomic, strong) SGKShijiHeaderView *topicbestHeaderView;

@end

@implementation SGKShijiTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [DYNetworking getShijiViewControllerData:self.apiUrl
                                       block:^(ShijiVCModel *model) {
                                           self.shijiModel = model;
                                           [self.tableView reloadData];
                                       } fail:^(NSError *error) {
                                           
                                       }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.shijiModel) {
        return 4;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.shijiModel.topic.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section == 2) {
        return 48.0f;
    }
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return self.bestHeaderView;
    }
    if (section == 2) {
        return self.topicbestHeaderView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        return [tableView fd_heightForCellWithIdentifier:hotCellIdentifier
                                        cacheByIndexPath:indexPath
                                           configuration:^(SGKShijiTableHotCell *cell) {
                                               [cell configureCell:self.shijiModel.hot];
                                           }];
    }
    if (section == 1) {
        return [tableView fd_heightForCellWithIdentifier:bestCellIdentifier
                                        cacheByIndexPath:indexPath
                                           configuration:^(SGKShijiTableBestCell *cell) {
                                               [cell configureCell:self.shijiModel.best];
                                           }];
    }
    if (section == 2) {
        return [tableView fd_heightForCellWithIdentifier:topicBestCellIdentifier
                                        cacheByIndexPath:indexPath
                                           configuration:^(SGKShijiTableTopicBestCell *cell) {
                                               [cell configureCell:self.shijiModel.topicBest];
                                           }];
    }
    return [tableView fd_heightForCellWithIdentifier:topicCellIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(SGKCourseVideoSubCell *cell) {
                                           [cell  configureCellWithShijiTopic:self.shijiModel.topic[indexPath.row]];
                                       }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        SGKShijiTableHotCell *cell = [tableView dequeueReusableCellWithIdentifier:hotCellIdentifier];
        [cell configureCell:self.shijiModel.hot];
        return cell;
    }
    if (section == 1) {
        SGKShijiTableBestCell *cell = [tableView dequeueReusableCellWithIdentifier:bestCellIdentifier];
        [cell configureCell:self.shijiModel.best];
        return cell;
    }
    if (section == 2) {
        SGKShijiTableTopicBestCell *cell = [tableView dequeueReusableCellWithIdentifier:topicBestCellIdentifier];
        [cell configureCell:self.shijiModel.topicBest];
        return cell;
    }
    SGKCourseVideoSubCell *cell = [tableView dequeueReusableCellWithIdentifier:topicCellIdentifier];
    [cell configureCellWithShijiTopic:self.shijiModel.topic[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        ShijiTopic *topic = self.shijiModel.topic[indexPath.row];
        SGKSubjectDetailViewController *viewController = [SGKSubjectDetailViewController new];
        viewController.url = topic.mob_h5_url;
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - getter and setter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[SGKShijiTableHotCell class] forCellReuseIdentifier:hotCellIdentifier];
        [_tableView registerClass:[SGKShijiTableBestCell class] forCellReuseIdentifier:bestCellIdentifier];
        [_tableView registerClass:[SGKShijiTableTopicBestCell class] forCellReuseIdentifier:topicBestCellIdentifier];
        [_tableView registerClass:[SGKCourseVideoSubCell class] forCellReuseIdentifier:topicCellIdentifier];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setTableFooterView:[UIView new]];
        [_tableView setSeparatorColor:[UIColor clearColor]];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (SGKShijiHeaderView *)bestHeaderView{
    if (!_bestHeaderView) {
        _bestHeaderView = [[SGKShijiHeaderView alloc]init];
        _bestHeaderView.titleLabel.text = @"每日特价";
        _bestHeaderView.moreLabel.text = @"每日10:00更新";
        _bestHeaderView.moreImg.image = [UIImage imageNamed:@""];
    }
    return _bestHeaderView;
}

- (SGKShijiHeaderView *)topicbestHeaderView{
    if (!_topicbestHeaderView) {
        _topicbestHeaderView = [[SGKShijiHeaderView alloc]init];
        _topicbestHeaderView.titleLabel.text = @"精选专题";
        _topicbestHeaderView.moreLabel.text = @"更多";
        _topicbestHeaderView.moreImg.image = [UIImage imageNamed:@""];

    }
    return _topicbestHeaderView;
}


@end
