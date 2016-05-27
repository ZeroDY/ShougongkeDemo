//
//  SGKCoursePicCollectionViewCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCoursePicCollectionViewCell.h"
#import "UIColor+SGKColorCategory.h"

@interface SGKCoursePicCollectionViewCell ()

@property (nonatomic, strong) UIImageView *titleImgView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *infoContainerView;
@property (nonatomic, strong) UILabel *title_lab;
@property (nonatomic, strong) UILabel *author_lab;
@property (nonatomic, strong) UILabel *info_lab;
@property (nonatomic, strong) UIView *line;

@end

@implementation SGKCoursePicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.containerView];
        [self.containerView addSubview:self.titleImgView];
        [self.containerView addSubview:self.infoContainerView];
        [self.infoContainerView addSubview:self.title_lab];
        [self.infoContainerView addSubview:self.author_lab];
        [self.infoContainerView addSubview:self.info_lab];
        [self.infoContainerView addSubview:self.line];
        [self layout];
    }
    return self;
}

- (void)configuraCellWith:(CoursePicListObject *)model{
    if (model) {
        self.containerView.backgroundColor = [UIColor colorWithHexString:model.bg_color];
        self.infoContainerView.backgroundColor = [UIColor colorWithHexString:model.bg_color];
        [self.titleImgView sd_setImageWithURL:[NSURL URLWithString:model.host_pic]];
        self.title_lab.text = model.subject;
        self.author_lab.text = [NSString stringWithFormat:@"by %@",model.user_name];
        self.info_lab.text = [NSString stringWithFormat:@"%@人气 / %@收藏",model.view,model.collect];
    }
}

- (void)layout{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.containerView);
        make.height.mas_equalTo(self.containerView.mas_width);
    }];
    
    [self.infoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.titleImgView.mas_bottom);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(self.infoContainerView.mas_left).offset(10);
        make.right.mas_equalTo(self.infoContainerView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.info_lab.mas_top).offset(-6);
    }];
    
    [self.info_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.line);
        make.bottom.mas_equalTo(self.infoContainerView.mas_bottom).offset(-6);
    }];
    
    [self.author_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.line);
        make.bottom.mas_equalTo(self.line.mas_top).offset(-6);
    }];
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.line);
        make.top.mas_equalTo(self.infoContainerView.mas_top);
        make.bottom.mas_equalTo(self.author_lab.mas_top);
    }];
}

- (UIImageView *)titleImgView{
    if (!_titleImgView) {
        _titleImgView = [UIImageView new];
        _titleImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _titleImgView;
}

- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.font = [UIFont systemFontOfSize:12];
        _title_lab.textColor = [UIColor whiteColor];
    }
    return _title_lab;
}

- (UILabel *)author_lab{
    if (!_author_lab) {
        _author_lab = [UILabel new];
        _author_lab.font = [UIFont systemFontOfSize:12];
        _author_lab.textColor = [UIColor colorWithWhite:1 alpha:0.5];
    }
    return _author_lab;
}

- (UILabel *)info_lab{
    if (!_info_lab) {
        _info_lab = [UILabel new];
        _info_lab.font = [UIFont systemFontOfSize:10];
        _info_lab.textColor = [UIColor colorWithWhite:1 alpha:0.5];
    }
    return _info_lab;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    }
    return _line;
}

- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _containerView.layer.shouldRasterize = YES;
        _containerView.layer.cornerRadius = 2;
    }
    return _containerView;
}

- (UIView *)infoContainerView{
    if (!_infoContainerView) {
        _infoContainerView = [UIView new];
    }
    return _infoContainerView;
}

@end
