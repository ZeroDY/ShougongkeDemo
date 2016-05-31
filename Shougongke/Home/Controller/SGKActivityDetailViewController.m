//
//  SGKActivityDetailViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/29.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKActivityDetailViewController.h"
#import "DYSegmentControllerView.h"
#import "DYSegmentContainerlView.h"
#import "SGKActivityIntroduceViewController.h"
#import "SGKActivityNewViewController.h"
#import "SGKBackToolBar.h"

@interface SGKActivityDetailViewController ()

@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *viewControllerArr;
@property (nonatomic, strong) DYSegmentControllerView *segmentView;
@property (nonatomic, strong) DYSegmentContainerlView *containerView;
@property (nonatomic, strong) SGKBackToolBar *toolBar;
@property (nonatomic, strong) UIButton *joinBtn;


@end

@implementation SGKActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动作品";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createSegmentView];
    [self createContainerView];
    [self.view addSubview:self.joinBtn];
    [self.view addSubview:self.toolBar];
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
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.toolBar.mas_top);
    }];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.mas_equalTo(self.view);
    }];
    [self.joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-48);
    }];
}

- (void)changeLayout:(JionButtonLayout) upOrDown{
    if (upOrDown == JionButtonLayoutUp) {
        [self.joinBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-48);
        }];
    }else{
        [self.joinBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(50);
        }];
    }
    [self.joinBtn setNeedsUpdateConstraints];
    [self.joinBtn updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.joinBtn layoutIfNeeded];
    }];
}

-(void)createSegmentView
{
    __weak typeof(self) weakSelf = self;
    self.segmentView = [[DYSegmentControllerView alloc] initWithStyle:DYSementStyleWidthEqualFull];
    self.segmentView.buttonWidth = SCREENWIDTH/3;
    self.segmentView.lineWidth = SCREENWIDTH/3-20;
    self.segmentView.selectedColor = mainColor;
    self.segmentView.titleFont = [UIFont systemFontOfSize:15];
    self.segmentView.unselectedColor = [UIColor darkGrayColor];
    [self.segmentView setTitleArr:@[@"活动介绍",@"最新作品",@"投票最多"]
                      andBtnBlock:^(UIButton *button) {
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

#pragma mark - getter and setter

- (NSMutableArray *)viewControllerArr{
    if (!_viewControllerArr) {
        _viewControllerArr = [NSMutableArray array];
        SGKActivityIntroduceViewController *introduceVC = [SGKActivityIntroduceViewController new];
        introduceVC.cid = self.activity.c_id;
        introduceVC.block = ^(NSInteger upOrDown){
            [self changeLayout:upOrDown];
        };
        [self addChildViewController:introduceVC];
        [_viewControllerArr addObject:introduceVC];
        
        SGKActivityNewViewController *newVC = [SGKActivityNewViewController new];
        newVC.cid = self.activity.c_id;
        newVC.order = @"new";
        newVC.block = ^(NSInteger upOrDown){
            [self changeLayout:upOrDown];
        };
        [self addChildViewController:newVC];
        [_viewControllerArr addObject:newVC];
        
        SGKActivityNewViewController *votesVC = [SGKActivityNewViewController new];
        votesVC.cid = self.activity.c_id;
        votesVC.order = @"votes";
        votesVC.block = ^(NSInteger upOrDown){
            [self changeLayout:upOrDown];
        };
        [self addChildViewController:votesVC];
        [_viewControllerArr addObject:votesVC];
    }
    return _viewControllerArr;
}

- (SGKBackToolBar *)toolBar{
    if (!_toolBar) {
        _toolBar = [[SGKBackToolBar alloc]initWithClick:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _toolBar;
}

- (UIButton *)joinBtn{
    if (!_joinBtn) {
        _joinBtn = [UIButton new];
        _joinBtn.backgroundColor = [UIColor clearColor];
        [_joinBtn setImage:[UIImage imageNamed:@"sgk_event_join_bt"] forState:UIControlStateNormal];
    }
    return _joinBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
