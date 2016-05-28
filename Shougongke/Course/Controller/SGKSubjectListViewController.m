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
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [DYNetworking getCourseSubjectListDataTageid:self.tag_id
                                           block:^(NSArray *array) {
        self.topicArray = array;
        [self setupTableView];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)setupTableView
{
    self.dyTableViewControllerDataSource =
    [[SGKTableViewControllerDataSource alloc]initWithItems:self.topicArray
                                            cellIdentifier:courseVideoSubCellIdentifier
                                        configureCellBlock:^(SGKCourseVideoSubCell *cell, TopicObject *topic) {
                                            [cell configureCellWithTopic:topic];
                                        }];
    
    self.tableView.dataSource = self.dyTableViewControllerDataSource;
}


#pragma mark - tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:courseVideoSubCellIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(SGKCourseVideoSubCell *cell) {
                                           [cell configureCellWithTopic:self.topicArray[indexPath.row]];
                                       }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
