//
//  SaleCellItem.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SaleCellItem.h"

@interface SaleCellItem()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *title_lab;
@property (nonatomic, strong) UILabel *price_lab;

@end

@implementation SaleCellItem

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.title_lab];
        [self.containerView addSubview:self.line];
        [self.containerView addSubview:self.price_lab];
        [self layout];
    }
    return self;
}

- (void)configureItem:(ShijiBest *)model{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.picurl]];
    self.title_lab.text = model.title;
    self.price_lab.text = [NSString stringWithFormat:@"￥%@",model.price];
}

- (void)layout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(self.mas_width);
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containerView.mas_top).offset(6);
        make.left.right.mas_equalTo(self.containerView);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title_lab.mas_bottom).offset(6);
        make.left.right.mas_equalTo(self.containerView);
        make.height.mas_equalTo(0.5);
    }];
    [self.price_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line.mas_bottom).offset(6);
        make.left.right.mas_equalTo(self.containerView);
        make.bottom.mas_equalTo(self.containerView.mas_bottom);
    }];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor lightGrayColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}
- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}
- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.textColor = [UIColor darkGrayColor];
        _title_lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
        _title_lab.numberOfLines = 2;
    }
    return _title_lab;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _line;
}
- (UILabel *)price_lab{
    if (!_price_lab) {
        _price_lab = [UILabel new];
        _price_lab.textColor = [UIColor redColor];
        _price_lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    }
    return _price_lab;
}

@end
