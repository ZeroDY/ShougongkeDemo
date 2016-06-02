//
//  SGKCourseDetailViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseDetailViewController.h"
#import "DYSegmentContainerlView.h"
#import "SGKBackToolBar.h"
#import "DYNetworking+CourseDetailHttpRequest.h"
#import "CourseDetail.h"
#import "SGKCourseDetailIntroductionViewController.h"
#import "UIViewController+SGKViewControllerCategory.h"
#import "SGKUserViewController.h"
#import "SGKCourseDetailMTViewController.h"
#import "SGKShijiViewController.h"
#import "SGKCourseDetailStepViewController.h"

@interface SGKCourseDetailViewController ()

@property (nonatomic, strong) DYSegmentContainerlView *containerView;
@property (nonatomic, strong) NSMutableArray *viewControllerArr;
@property (nonatomic, strong) SGKBackToolBar *toolBar;
@property (nonatomic, strong) CourseDetail *courseDetail;
@property (nonatomic, strong) UIButton *pageBtn;

@end

@implementation SGKCourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.toolBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    [self.navigationController setNavigationBarHidden:YES animated:YES];//隐藏
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [self getCourseDetailData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self setStatusBarBackgroundColor:mainColor];
    [self.navigationController setNavigationBarHidden:NO animated:NO];//显示
}
/**
 *	更新布局
 */
- (void)updatelLayout{
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.pageBtn];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.toolBar.mas_top);
    }];
   
    [self.pageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(20);
        make.height.mas_equalTo(26);
        make.width.mas_equalTo(90);
    }];
}

/**
 *	获取数据
 */
- (void)getCourseDetailData{
    [DYNetworking getCourseDetailWithCourseId:self.cid
                                        block:^(CourseDetail *model) {
                                            self.courseDetail = model;
                                            [self createContainerView];
                                        } fail:^(NSError *error) {
                                            
                                        }];
}
/**
 *	创建配置滑动容器视图
 */
-(void)createContainerView
{
    __weak typeof(self) weakSelf = self;
    self.containerView = [[DYSegmentContainerlView alloc]initWithSeleterConditionTitleArr:self.viewControllerArr andBtnBlock:^(int index) {
        if (index > 1) {
            weakSelf.pageBtn.hidden = NO;
            [weakSelf.pageBtn setTitle:[NSString stringWithFormat:@"步骤%d/%zd",index-1,weakSelf.courseDetail.step.count] forState:UIControlStateNormal];
        }else{
            weakSelf.pageBtn.hidden = YES;
        }
    }];

    [self updatelLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - getter setter
- (SGKBackToolBar *)toolBar{
    if (!_toolBar) {
        _toolBar = [[SGKBackToolBar alloc]initWithClick:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _toolBar;
}

- (UIButton *)pageBtn{
    if (!_pageBtn) {
        _pageBtn = [UIButton new];
        [_pageBtn setImage:[UIImage imageNamed:@"page"] forState:UIControlStateNormal];
        [_pageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pageBtn setTitle:@"步骤" forState:UIControlStateNormal];
        [_pageBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        _pageBtn.layer.shouldRasterize = YES;
        _pageBtn.layer.masksToBounds = YES;
        _pageBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _pageBtn.layer.cornerRadius = 13;
        _pageBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _pageBtn.layer.borderWidth = 1.0f;
        _pageBtn.hidden = YES;
    }
    return _pageBtn;
}

- (NSMutableArray *)viewControllerArr{
    if (!_viewControllerArr) {
        _viewControllerArr = [NSMutableArray array];
        
        SGKCourseDetailIntroductionViewController *introductionVC = [[SGKCourseDetailIntroductionViewController alloc]init];
        introductionVC.courseDetail = self.courseDetail;
        [self addChildViewController:introductionVC];
        [_viewControllerArr addObject:introductionVC];
        
        SGKCourseDetailMTViewController *mtVC = [SGKCourseDetailMTViewController new];
        mtVC.dataArray = @[self.courseDetail.material,self.courseDetail.tools];
        [self addChildViewController:mtVC];
        [_viewControllerArr addObject:mtVC];
        
        for (CourseDetailStep *stepModel in self.courseDetail.step) {
            SGKCourseDetailStepViewController *stepVC = [SGKCourseDetailStepViewController new];
            stepVC.step = stepModel;
            [self addChildViewController:stepVC];
            [_viewControllerArr addObject:stepVC];
        }
    }
    return _viewControllerArr;
}



@end
