//
//  HomeTableHeaderView.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/20.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKHomeTableHeaderView.h"

@implementation SGKHomeTableHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.signinButton];
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.signinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.height.mas_equalTo(32);
        make.width.mas_equalTo(88);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.centerY.mas_equalTo(self.signinButton.mas_centerY);
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

- (UIButton *)signinButton{
    if (!_signinButton) {
        _signinButton = [[UIButton alloc]init];
        _signinButton.backgroundColor = RGB(254, 252, 205);
        [_signinButton setTitle:@"签到" forState: UIControlStateNormal];
        [_signinButton setTitleColor:RGB(107, 99, 55) forState:UIControlStateNormal];
        [_signinButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_signinButton setImage:[UIImage imageNamed:@"sgk_sgb_icon_orange"] forState:UIControlStateNormal];
        _signinButton.imageEdgeInsets = UIEdgeInsetsMake(0, 32, 0, -32);
        _signinButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 25);
        _signinButton.layer.shouldRasterize = YES;
        _signinButton.layer.cornerRadius = 4.0f;
        _signinButton.layer.borderColor = RGB(250, 210, 125).CGColor;
        _signinButton.layer.borderWidth = 1;
        _signinButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _signinButton;
}

@end
