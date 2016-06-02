//
//  SGKCoursePicViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCoursePicViewController.h"
#import "DYMenuView.h"
#import "SGKCollectionViewControllerDelegate.h"
#import "DYNetworking+CoursePicListHttpRequest.h"
#import "SGKCoursePicCollectionViewCell.h"
#import "CoursePicListObject.h"
#import "SGKRefreshHeader.h"
#import "SGKCourseDetailViewController.h"

static NSString *picViewControllerCellIdentifier = @"SGKCoursePicCollectionViewCell";

@interface SGKCoursePicViewController ()

@property (nonatomic, strong) DYMenuView *menuView;
@property (nonatomic, strong) SGKCollectionViewControllerDelegate *collectionDelegate;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SGKCoursePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatCollectionView];
    [self.view addSubview:self.menuView];
    [self addRefresh];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}
/**
 *	下拉刷新
 */
- (void)addRefresh{
    self.collectionView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self getViewControllerDataModel];
    }];
}
/**
 *	获取数据
 */
- (void)getViewControllerDataModel{
    [DYNetworking getCoursePicListDataWithParam:self.dataModel.requestParamDic
                                          block:^(NSArray *array) {
                                              [self.collectionView.mj_header endRefreshing];
                                              self.collectionDelegate.dataArray = array;
                                              [self.collectionView reloadData];
                                          } fail:^(NSError *error) {
                                              [self.collectionView.mj_header endRefreshing];
                                          }];
}
/**
 *	创建配置菜单view
 */
- (void)configureMenuView{
    if (self.dataModel.menuDataArr) {
        [self.menuView configureViewWith:self.dataModel.menuDataArr selectIndex:^(NSInteger itemIndex, NSInteger cellIndex) {
            NSLog(@"----%ld----%ld",itemIndex,cellIndex);
            [self.dataModel changeRequestParamDic:itemIndex value:cellIndex];
            [self getViewControllerDataModel];
        }];
    }
}
/**
 *	通过SGKCollectionViewControllerDelegate创建CollectionView
 */
- (void)creatCollectionView{
    self.collectionDelegate =
    [[SGKCollectionViewControllerDelegate alloc]initWithItems:nil
                                               cellIdentifier:picViewControllerCellIdentifier
                                           configureCellBlock:^(SGKCoursePicCollectionViewCell *cell, CoursePicListObject *data) {
                                               [cell configuraCellWith:data];
                                           } selectCellBlock:^(NSIndexPath *index,CoursePicListObject *data) {
                                               NSLog(@"----%@",data.subject);
                                               SGKCourseDetailViewController *courseDetailVC = [SGKCourseDetailViewController new];
                                               courseDetailVC.cid = data.hand_id;
                                               courseDetailVC.hidesBottomBarWhenPushed = YES;
                                               [self.navigationController pushViewController:courseDetailVC animated:YES];
                                           }];
    //CollectionView布局配置
    CGSize cellSize = CGSizeMake((SCREENWIDTH-30)/2.0f, (SCREENWIDTH-30)/2.0f+80);
    self.collectionDelegate.flowLayout.itemSize = cellSize;
    self.collectionDelegate.flowLayout.minimumLineSpacing = 10.0f;
    self.collectionDelegate.flowLayout.minimumInteritemSpacing = 10.0f;
    self.collectionDelegate.flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionDelegate.flowLayout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SGKCoursePicCollectionViewCell class]
            forCellWithReuseIdentifier:picViewControllerCellIdentifier];
    self.collectionView.dataSource = self.collectionDelegate;
    self.collectionView.delegate = self.collectionDelegate;
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - getter setter

- (DYMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[DYMenuView alloc]init];
        _menuView.deselectColor = [UIColor darkGrayColor];
    }
    return _menuView;
}

- (SGKPicViewControllerDataModel *)dataModel{
    if (!_dataModel) {
        _dataModel = [[SGKPicViewControllerDataModel alloc]init];
    }
    return _dataModel;
}

@end
