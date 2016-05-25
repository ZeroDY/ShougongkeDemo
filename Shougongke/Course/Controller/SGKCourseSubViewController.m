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

@property(nonatomic,retain)NSArray *titleArr;
@property(nonatomic,retain)NSMutableArray *viewControllerArr;

@property(nonatomic,retain)DYSegmentControllerView *segmentView;
@property(nonatomic,retain)DYSegmentContainerlView *containerView;


@end

@implementation SGKCourseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    self.titleArr = @[@"精选",@"每日热门",@"入坑指南",@"创意DIY",@"吃货专属",@"萌属性",@"达人推荐",@"一周精选"];
    self.viewControllerArr = [NSMutableArray array];
    
    for (int i = 0; i < 8 ; i++) {
        SGKSubjectListViewController *vc = [[SGKSubjectListViewController alloc]init];
        [self addChildViewController:vc];
        [self.viewControllerArr addObject:vc];
    }
    
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

-(void)createSegmentView
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

-(void)createContainerView
{
    __weak typeof(self) weakSelf = self;
    self.containerView = [[DYSegmentContainerlView alloc]initWithSeleterConditionTitleArr:self.viewControllerArr andBtnBlock:^(int index) {
        [weakSelf.segmentView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:self.containerView];
}
@end