//
//  DYMenuCollectionViewCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYMenuCollectionViewCell.h"

#define CellBgColor       [UIColor whiteColor]
#define CellTitleColor    [UIColor darkGrayColor]

@interface DYMenuCollectionViewCell ()

@property (nonatomic, strong) UIView *line;

@end

@implementation DYMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = CellBgColor;
        [self.contentView addSubview:self.titleImgView];
        [self.contentView addSubview:self.title_lab];
        [self.contentView addSubview:self.line];
        [self layout];
    }
    return self;
}

- (void)configuraCellWith:(DYMenuDataModel *)model{
    self.title_lab.text = model.title;
    if (model.imgName) {
        self.titleImgView.image = [UIImage imageNamed:model.imgName];
    }else{
        [self.titleImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    }
}

- (void)layout{
    [self.titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.width.mas_equalTo(20);
        
    }];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleImgView.mas_right).offset(10);
        make.centerY.mas_equalTo(self.titleImgView.mas_centerY);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

- (UIImageView *)titleImgView{
    if (!_titleImgView) {
        _titleImgView = [UIImageView new];
    }
    return _titleImgView;
}

- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _title_lab.textColor = CellTitleColor;
        _title_lab.textAlignment = NSTextAlignmentLeft;
    }
    return _title_lab;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

@end