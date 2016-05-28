//
//  SGKShijiHeaderView.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiHeaderView.h"

@implementation SGKShijiHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.moreImg];
        [self addSubview:self.moreLabel];
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.moreImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
    }];
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moreImg.mas_left);
        make.centerY.mas_equalTo(self.moreImg.mas_centerY);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(6);
    }];
    
}

#pragma mark - getter setter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView *)moreImg{
    if (!_moreImg) {
        _moreImg = [UIImageView new];
    }
    return _moreImg;
}

- (UILabel *)moreLabel{
    if (!_moreLabel) {
        _moreLabel = [UILabel new];
        _moreLabel.textColor = [UIColor lightGrayColor];
        _moreLabel.font = [UIFont systemFontOfSize:10];
    }
    return _moreLabel;
}


@end
