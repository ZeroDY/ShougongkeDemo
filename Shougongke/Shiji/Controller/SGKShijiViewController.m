//
//  ShijiViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiViewController.h"
#import "DYSegmentControllerView.h"
#import "DYSegmentContainerlView.h"
#import "SGKShijiTableViewController.h"

@interface SGKShijiViewController ()

@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, strong) DYSegmentControllerView *segmentView;
@property (nonatomic, strong) DYSegmentContainerlView *containerView;
@property (nonatomic, strong) NSMutableArray *viewControllerArr;

@end

@implementation SGKShijiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"市集";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.rightItem;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createSegmentView
{
    __weak typeof(self) weakSelf = self;
    self.segmentView = [[DYSegmentControllerView alloc] initWithStyle:DYSementStyleWidthEqualFull];
    self.segmentView.buttonWidth = SCREENWIDTH/2;
    self.segmentView.lineWidth = SCREENWIDTH/2-60;
    self.segmentView.selectedColor = mainColor;
    self.segmentView.unselectedColor = [UIColor darkGrayColor];
    [self.segmentView setTitleArr:@[@"手作市集",@"材料商店"] andBtnBlock:^(UIButton *button) {
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
        SGKShijiTableViewController *shouzuoVC = [[SGKShijiTableViewController alloc]init];
        shouzuoVC.apiUrl = SGKApiKeyShijiProduct;
        [self addChildViewController:shouzuoVC];
        [_viewControllerArr addObject:shouzuoVC];
        
        SGKShijiTableViewController *cailiaoVC = [[SGKShijiTableViewController alloc]init];
        cailiaoVC.apiUrl = SGKApiKeyShijiCailiao;
        [self addChildViewController:cailiaoVC];
        [_viewControllerArr addObject:cailiaoVC];
    }
    return _viewControllerArr;
}

- (UIBarButtonItem *)leftItem{
    if (!_leftItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 25, 25);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_market_shopping"] forState:UIControlStateNormal];
//        [publisButton addTarget:self action:@selector(showleft) forControlEvents:UIControlEventTouchUpInside];
        _leftItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _leftItem;
}

- (UIBarButtonItem *)rightItem{
    if (!_rightItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 20, 20);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_common_search_normal"] forState:UIControlStateNormal];
//        [publisButton addTarget:self action:@selector(showright) forControlEvents:UIControlEventTouchUpInside];
        _rightItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _rightItem;
}


@end
