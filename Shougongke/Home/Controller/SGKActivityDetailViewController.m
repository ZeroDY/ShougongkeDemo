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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createSegmentView
{
    __weak typeof(self) weakSelf = self;
    self.segmentView = [[DYSegmentControllerView alloc] initWithStyle:DYSementStyleWidthEqualFull];
    self.segmentView.buttonWidth = SCREENWIDTH/3;
    self.segmentView.lineWidth = SCREENWIDTH/3-40;
    self.segmentView.selectedColor = mainColor;
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
        [self addChildViewController:introduceVC];
        [_viewControllerArr addObject:introduceVC];
        
        SGKActivityNewViewController *newVC = [SGKActivityNewViewController new];
        [self addChildViewController:newVC];
        [_viewControllerArr addObject:newVC];
        
        SGKActivityNewViewController *more = [SGKActivityNewViewController new];
        [self addChildViewController:more];
        [_viewControllerArr addObject:more];
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
        _joinBtn.backgroundColor = [UIColor orangeColor];
    }
    return _joinBtn;
}



@end
