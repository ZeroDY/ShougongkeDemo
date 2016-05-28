//
//  SGKCourseVideoViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseVideoViewController.h"
#import "DYMenuView.h"
#import "SGKTableViewControllerDataSource.h"
#import "SGKCourseVideoSubCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "DYNetworking+CourseVideoListHttpRequest.h"

static NSString *courseVideoSubCellIdentifier = @"SGKCourseVideoSubCell";

@interface SGKCourseVideoViewController ()<UITableViewDelegate>

@property (nonatomic, strong) DYMenuView *menuView;
@property (nonatomic, strong) SGKTableViewControllerDataSource *dyTableViewControllerDataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SGKCourseVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.menuView];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [self getViewControllerDataModel];
    
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)getViewControllerDataModel{
    [DYNetworking getCourseVideoListDataWithParam:self.dataModel.requestParamDic
                                            block:^(NSArray *array) {
        self.dataModel.videoArray = array;
        self.dyTableViewControllerDataSource.items = array;
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)configureMenuView{
    if (self.dataModel.menuDataArr) {
        [self.menuView configureViewWith:self.dataModel.menuDataArr selectIndex:^(NSInteger itemIndex, NSInteger cellIndex) {
            NSLog(@"----%ld----%ld",itemIndex,cellIndex);
            [self.dataModel changeRequestParamDic:itemIndex value:cellIndex];
            [self getViewControllerDataModel];
        }];
    }
}
- (void)setupTableView
{
    self.dyTableViewControllerDataSource =
    [[SGKTableViewControllerDataSource alloc]initWithItems:self.dataModel.videoArray
                                            cellIdentifier:courseVideoSubCellIdentifier
                                        configureCellBlock:^(SGKCourseVideoSubCell *cell, CourseVideo *video) {
                                            [cell configureCellWithVideo:video];
                                        }];
    
    self.tableView.dataSource = self.dyTableViewControllerDataSource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:courseVideoSubCellIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(SGKCourseVideoSubCell *cell) {
                                           [cell configureCellWithVideo:self.dataModel.videoArray[indexPath.row]];
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

- (DYMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[DYMenuView alloc]init];
        _menuView.deselectColor = [UIColor darkGrayColor];
    }
    return _menuView;
}

- (SGKVideoViewControllerDataModel *)dataModel{
    if (!_dataModel) {
        _dataModel = [[SGKVideoViewControllerDataModel alloc]init];
    }
    return _dataModel;
}


@end
