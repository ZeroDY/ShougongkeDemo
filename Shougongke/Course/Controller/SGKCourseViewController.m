//
//  CourseViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseViewController.h"
#import "SGKCourseControllerTitleView.h"
#import "DYSegmentContainerlView.h"
#import "SGKCoursePicViewController.h"
#import "SGKCourseVideoViewController.h"
#import "SGKCourseSubViewController.h"
#import "DYNetworking+CourseCategoryHttpRequest.h"

@interface SGKCourseViewController ()

@property (nonatomic, strong) UIBarButtonItem *searchItem;
@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, strong) SGKCourseControllerTitleView *titleView;
@property (nonatomic, strong) DYSegmentContainerlView *containerView;

@property (nonatomic, strong) SGKCoursePicViewController *pictureVC;
@property (nonatomic, strong) SGKCourseVideoViewController *videoVC;
@property (nonatomic, strong) SGKCourseSubViewController *subjectVC;

@property (nonatomic, copy) NSArray *controllerArray;
@property (nonatomic, copy) NSArray *categoryArray;


@end

@implementation SGKCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"教程";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.searchItem;
    
    [self createTitleView];
    [self createContainerView];
    self.automaticallyAdjustsScrollViewInsets = NO;//关键
    
    [DYNetworking getCourseCategoryData:^(NSArray *array) {
        self.categoryArray = [array copy];
        self.pictureVC.categoryArray = self.categoryArray;
        self.videoVC.categoryArray = self.categoryArray;
    } fail:^(NSError *error) {
        
    }];
}

-(void)createTitleView
{
    __weak typeof(self) weakSelf = self;
    self.titleView = [[SGKCourseControllerTitleView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)
                                                                   block:^(UIButton *button) {
        [weakSelf.containerView updateVCViewFromIndex:button.tag];
    }];
    self.navigationItem.titleView = self.titleView;
}

-(void)createContainerView
{
    self.pictureVC = [[SGKCoursePicViewController alloc]init];
    self.videoVC = [[SGKCourseVideoViewController alloc]init];
    self.subjectVC = [[SGKCourseSubViewController alloc]init];
    [self addChildViewController:self.pictureVC];
    [self addChildViewController:self.videoVC];
    [self addChildViewController:self.subjectVC];
    self.controllerArray = @[self.pictureVC,self.videoVC,self.subjectVC];
    __weak typeof(self) weakSelf = self;
    self.containerView = [[DYSegmentContainerlView alloc]initWithSeleterConditionTitleArr:self.controllerArray andBtnBlock:^(int index) {
        [weakSelf.titleView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:self.containerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showleft{
    NSLog(@"left");
}

- (void)showright{
    NSLog(@"right");
}

- (void)viewWillAppear:(BOOL)animated{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark - getter and setter

- (UIBarButtonItem *)leftItem{
    if (!_leftItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 25, 25);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_bt_userhome_publish2"] forState:UIControlStateNormal];
        [publisButton addTarget:self action:@selector(showleft) forControlEvents:UIControlEventTouchUpInside];
        _leftItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _leftItem;
}

- (UIBarButtonItem *)searchItem{
    if (!_searchItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 20, 20);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_common_search_normal"] forState:UIControlStateNormal];
        [publisButton addTarget:self action:@selector(showright) forControlEvents:UIControlEventTouchUpInside];
        _searchItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _searchItem;
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
