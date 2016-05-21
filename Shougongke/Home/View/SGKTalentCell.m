//
//  SGKTalentCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/21.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKTalentCell.h"

@interface SGKTalentCell()

@property (nonatomic, strong) UIImageView *head_imgView;
@property (nonatomic, strong) UIImageView *bg_imgView;
@property (nonatomic, strong) UIImageView *sex_imgView;
@property (nonatomic, strong) UIImageView *level_imgView;
@property (nonatomic, strong) UILabel *userName_lab;
@property (nonatomic, strong) UILabel *addr_lab;
@property (nonatomic, strong) UILabel *info_lab;
@property (nonatomic, strong) UIButton *attention_btn;

@end

@implementation SGKTalentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.bg_imgView];
        [self.contentView addSubview:self.head_imgView];
        [self.contentView addSubview:self.level_imgView];
        [self.contentView addSubview:self.sex_imgView];
        [self.contentView addSubview:self.userName_lab];
        [self.contentView addSubview:self.info_lab];
        [self.contentView addSubview:self.addr_lab];
        [self.contentView addSubview:self.attention_btn];
        [self layout];
    }
    return self;
}


- (void)layout{
    [self.bg_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        make.height.mas_equalTo(210);
    }];
    
    [self.head_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bg_imgView.mas_top).offset(10);
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.width.height.mas_equalTo(76);
    }];
    
    [self.level_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.centerY.mas_equalTo(self.head_imgView.mas_bottom);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(54);
    }];
    
    [self.userName_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.top.mas_equalTo(self.level_imgView.mas_bottom).offset(6);
    }];
    
    [self.sex_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.userName_lab.mas_centerY);
        make.left.mas_equalTo(self.userName_lab.mas_right);
    }];
    
    [self.addr_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.top.mas_equalTo(self.userName_lab.mas_bottom).offset(10);
    }];
    
    [self.info_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.top.mas_equalTo(self.addr_lab.mas_bottom).offset(6);
    }];
    
    [self.attention_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bg_imgView.mas_centerX);
        make.top.mas_equalTo(self.info_lab.mas_bottom).offset(6);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(80);
    }];
    
}

#pragma mark - getter setter
- (void)setTalent:(TalentObject *)talent{
    [self.bg_imgView sd_setImageWithURL:[NSURL URLWithString:talent.bg_image]];
    [self.head_imgView sd_setImageWithURL:[NSURL URLWithString:talent.avatar]];
    [self.level_imgView setImage:[UIImage imageNamed:@"sgk_leve_vip"]];
    [self.sex_imgView setImage:[UIImage imageNamed:@"sgk_icon_usergender_girl"]];
    self.addr_lab.text = talent.region;
    self.userName_lab.text = talent.uname;
    self.info_lab.text = [NSString stringWithFormat:@"教程%@·粉丝%@·手工圈%@",talent.coursecount,talent.fen_num,talent.circle_count];
}

- (UILabel *)userName_lab{
    if (!_userName_lab) {
        _userName_lab = [UILabel new];
        _userName_lab.textColor = [UIColor whiteColor];
        _userName_lab.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    }
    return _userName_lab;
}

- (UILabel *)addr_lab{
    if (!_addr_lab) {
        _addr_lab = [UILabel new];
        _addr_lab.textColor = [UIColor whiteColor];
        _addr_lab.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _addr_lab;
}

- (UILabel *)info_lab{
    if (!_info_lab) {
        _info_lab = [UILabel new];
        _info_lab.textColor = [UIColor whiteColor];
        _info_lab.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _info_lab;
}

- (UIImageView *)bg_imgView{
    if (!_bg_imgView) {
        _bg_imgView = [UIImageView new];
        [_bg_imgView setContentMode:UIViewContentModeScaleAspectFill];
        _bg_imgView.layer.cornerRadius = 4.0f;
        _bg_imgView.layer.masksToBounds = YES;
        _bg_imgView.layer.shouldRasterize = YES;
        _bg_imgView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _bg_imgView;
}

- (UIImageView *)head_imgView{
    if (!_head_imgView) {
        _head_imgView = [UIImageView new];
        _head_imgView.layer.cornerRadius = 38.0f;
        _head_imgView.layer.borderColor = [UIColor whiteColor].CGColor;
        _head_imgView.layer.borderWidth = 2.0f;
        _head_imgView.layer.masksToBounds = YES;
        _head_imgView.layer.shouldRasterize = YES;
        _head_imgView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _head_imgView;
}

- (UIImageView *)sex_imgView{
    if (!_sex_imgView) {
        _sex_imgView = [UIImageView new];
    }
    return _sex_imgView;
}

- (UIImageView *)level_imgView{
    if (!_level_imgView) {
        _level_imgView = [UIImageView new];
    }
    return _level_imgView;
}

- (UIButton *)attention_btn{
    if (!_attention_btn) {
        _attention_btn = [UIButton new];
        _attention_btn.enabled = NO;
        _attention_btn.titleLabel.textColor = [UIColor whiteColor];
        _attention_btn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_attention_btn setTitle:@"关注"  forState:UIControlStateNormal];
        _attention_btn.layer.shouldRasterize = YES;
        _attention_btn.layer.cornerRadius = 14.0f;
        _attention_btn.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _attention_btn.layer.borderColor = [UIColor whiteColor].CGColor;
        _attention_btn.layer.borderWidth = 1.0f;
    }
    return _attention_btn;
}



@end















