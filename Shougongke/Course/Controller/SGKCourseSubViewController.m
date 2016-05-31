//
//  SGKCourseSubViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseSubViewController.h"
#import "DYSegmentControllerView.h"
#import "DYSegmentContainerlView.h"
#import "SGKSubjectListViewController.h"

@interface SGKCourseSubViewController ()

@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *viewControllerArr;
@property (nonatomic, strong) DYSegmentControllerView *segmentView;
@property (nonatomic, strong) DYSegmentContainerlView *containerView;


@end

@implementation SGKCourseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self createSegmentView];
    [self createContainerView];
    self.automaticallyAdjustsScrollViewInsets = NO;//关键
}

- (void)viewWillAppear:(BOOL)animated{
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).offset(0);
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.segmentView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)createSegmentView
{
    __weak typeof(self) weakSelf = self;
    self.segmentView = [[DYSegmentControllerView alloc] initWithStyle:DYSementStyleDefault];
    self.segmentView.selectedColor = mainColor;
    self.segmentView.unselectedColor = [UIColor darkGrayColor];
    [self.segmentView setTitleArr:self.titleArr andBtnBlock:^(UIButton *button) {
        [weakSelf.containerView updateVCViewFromIndex:button.tag];
    }];
    [self.view addSubview:self.segmentView];
}

- (void)createContainerView
{
    __weak typeof(self) weakSelf = self;
    self.containerView = [[DYSegmentContainerlView alloc]initWithSeleterConditionTitleArr:self.viewControllerArr andBtnBlock:^(int index) {
        [weakSelf.segmentView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:self.containerView];
}
#pragma mark -  getter setter

- (NSMutableArray *)viewControllerArr{
    if (!_viewControllerArr) {
        NSArray *tagIdArr = @[@"53",@"57",@"52",@"28",@"54",@"1",@"55",@"3",@"45"];
        _viewControllerArr = [NSMutableArray array];
        for (int i = 0; i < 9 ; i++) {
            SGKSubjectListViewController *vc = [[SGKSubjectListViewController alloc]init];
            vc.tag_id = tagIdArr[i];
            [self addChildViewController:vc];
            [_viewControllerArr addObject:vc];
        }
    }
    return _viewControllerArr;
}

- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"热门教程",@"精选手工圈",@"一周精选",@"入坑指南",@"达人推荐",@"小编推荐",@"创意DIY",@"吃货属性",@"萌属性"];
    }
    return _titleArr;
}

@end