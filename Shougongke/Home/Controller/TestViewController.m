//
//  InfoViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/19.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "TestViewController.h"
#import "SGKBackToolBar.h"

@interface TestViewController()

@property (nonatomic, strong) UIImageView *bgImgView;

@end

@implementation TestViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton = YES;
    SGKBackToolBar *toolbar = [[SGKBackToolBar alloc]initWithClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:self.bgImgView];
    [self.view addSubview:toolbar];
    
    
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (UIImageView *)bgImgView{
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.backgroundColor = [UIColor whiteColor];
        _bgImgView.image = [UIImage imageNamed:@"loginBackground"];
    }
    return _bgImgView;
}

@end
