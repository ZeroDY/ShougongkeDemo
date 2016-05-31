//
//  SGKCourseDetailIntroductionViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseDetailIntroductionViewController.h"

@interface SGKCourseDetailIntroductionViewController ()

@property (nonatomic, strong) UIImageView *backgroundImgView;
@property (nonatomic, strong) UILabel *title_lab;
@property (nonatomic, strong) UILabel *introduction_lab;
@property (nonatomic, strong) UILabel *category_lab;
@property (nonatomic, strong) UIImageView *categoryImgView;
@property (nonatomic, strong) UILabel *author_lab;
@property (nonatomic, strong) UIButton *author_Btn;
@property (nonatomic, strong) UILabel *info_lab;

@end

@implementation SGKCourseDetailIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubViews];
    [self.view addSubview:self.backgroundImgView];
    [self.view addSubview:self.title_lab];
    [self.view addSubview:self.introduction_lab];
    [self.view addSubview:self.category_lab];
    [self.view addSubview:self.categoryImgView];
    [self.view addSubview:self.author_lab];
    [self.view addSubview:self.author_Btn];
    [self.view addSubview:self.info_lab];
    [self layout];
    [self configureController];
}

- (void)createSubViews{
    self.title_lab = [self getaLabel:20];
    self.title_lab.textAlignment = NSTextAlignmentCenter;
    self.introduction_lab = [self getaLabel:13];
    self.introduction_lab.numberOfLines = 0;
    self.category_lab = [self getaLabel:13];
    self.author_lab = [self getaLabel:20];
    self.info_lab = [self getaLabel:13];
    self.backgroundImgView = [UIImageView new];
    self.backgroundImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImgView.layer.masksToBounds = YES;
    self.categoryImgView = [UIImageView new];
    self.author_Btn = [UIButton new];
    self.author_Btn.layer.cornerRadius = 24;
    self.author_Btn.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.author_Btn.layer.shouldRasterize = YES;
    self.author_Btn.layer.masksToBounds = YES;
}

- (void)configureController{
    [self.backgroundImgView sd_setImageWithURL:[NSURL URLWithString:self.courseDetail.host_pic_m]];
    self.title_lab.text = self.courseDetail.subject;
    self.introduction_lab.text = self.courseDetail.summary;
    self.category_lab.text = self.courseDetail.cate_name;
    self.author_lab.text = self.courseDetail.user_name;
    [self.categoryImgView sd_setImageWithURL:[NSURL URLWithString:self.courseDetail.cate_pic]];
    [self.author_Btn sd_setImageWithURL:[NSURL URLWithString:self.courseDetail.face_pic] forState:UIControlStateNormal];
    NSString *info = [NSString stringWithFormat:@"%@人气 | %@收藏 | %@评论 | %@赞",
                      self.courseDetail.view_o,self.courseDetail.collect,
                      self.courseDetail.comment_num,self.courseDetail.laud];
    self.info_lab.text = info;
}

- (void)layout{
    [self.backgroundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-30);
    }];
    UIView *topLine = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.left.right.mas_equalTo(self.title_lab);
            make.top.mas_equalTo(self.title_lab.mas_bottom).offset(30);
        }];
        view;
    });
    [self.introduction_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.title_lab);
        make.top.mas_equalTo(topLine.mas_bottom).offset(6);
    }];
    UIView *bottomLine = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.left.right.mas_equalTo(self.title_lab);
            make.top.mas_equalTo(self.introduction_lab.mas_bottom).offset(8);
        }];
        view;
    });
    [self.categoryImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.title_lab.mas_left);
        make.top.mas_equalTo(bottomLine.mas_bottom).offset(6);
        make.height.width.mas_equalTo(20);
    }];
    [self.category_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.categoryImgView.mas_centerY);
        make.left.mas_equalTo(self.categoryImgView.mas_right).offset(6);
    }];
    
    [self.author_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_centerY).offset(36);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.width.mas_equalTo(48);
    }];
    [self.author_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.author_Btn.mas_bottom).offset(6);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    [self.info_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.author_lab.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter setter
- (UILabel *)getaLabel:(NSInteger)size{
    UILabel *label = [UILabel new];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:size];
    return label;
}


@end
