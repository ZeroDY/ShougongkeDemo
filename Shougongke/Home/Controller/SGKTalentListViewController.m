//
//  SGKTalentListViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/24.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKTalentListViewController.h"
#import "SGKTalentListCell.h"
#import "DYTableViewControllerDataSource.h"
#import "SGKBackToolBar.h"
#import "DYNetworking+TalentListHttpRequest.h"
#import "UITableView+FDTemplateLayoutCell.h"

static NSString *cellIdentifier = @"SGKTalentListCell";

@interface SGKTalentListViewController()<UITableViewDelegate>

@property (nonatomic, strong) NSArray *talentArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DYTableViewControllerDataSource *dyTableViewControllerDataSource;
@property (nonatomic, strong) SGKBackToolBar *toolBar;

@end

@implementation SGKTalentListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手工达人";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBar];
    [self.navigationItem setHidesBackButton:YES];
    
    [DYNetworking getTalentListControllerData:^(NSArray *array) {
        self.talentArray = array;
        [self setupTableView];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)setupTableView
{
    self.dyTableViewControllerDataSource =
    [[DYTableViewControllerDataSource alloc]initWithItems:self.talentArray
                                           cellIdentifier:cellIdentifier
                                       configureCellBlock:^(SGKTalentListCell *cell, TalentListModel *talent) {
                                           [cell configureCell:talent];
                                       }];
    
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
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(SGKTalentListCell *cell) {
        [cell configureCell:self.talentArray[indexPath.row]];
    }];
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
