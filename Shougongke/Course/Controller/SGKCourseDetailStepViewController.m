//
//  SGKCourseDetailStepViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/6/1.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseDetailStepViewController.h"

@interface SGKCourseDetailStepViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *info_lab;

@end

@implementation SGKCourseDetailStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.containerView];
    [self.containerView addSubview:self.imageView];
    [self.containerView addSubview:self.info_lab];

    [self configureSubView];
}
/**
 *	布局放在viewDidAppear中，在父 controller页面没有数据时viewwillappear 不执行，原因 待查
 *
 *	@param animated	<#animated description#>
 */
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.scrollView.mas_width);
        make.edges.mas_equalTo(0);
    }];
    NSInteger height = 425/320.0f*SCREENWIDTH;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.containerView);
        make.height.mas_equalTo(height);
    }];
    [self.info_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).offset(10);
        make.right.mas_equalTo(self.containerView.mas_right).offset(-10);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-10);
    }];
}
/**
 *	配置显示内容
 */
- (void)configureSubView{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.step.pic]];
    [self.info_lab setText:self.step.content];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter  getter

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor lightGrayColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)info_lab{
    if (!_info_lab) {
        _info_lab = [UILabel new];
        _info_lab.font = [UIFont systemFontOfSize:15];
        _info_lab.textColor = [UIColor darkGrayColor];
        _info_lab.numberOfLines = 0;
    }
    return _info_lab;
}

@end
