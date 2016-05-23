//
//  SGKTalentListCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKTalentListCell.h"
#import <SDWebImage/UIButton+WebCache.h>

@interface SGKTalentListCell()

@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *level_imgView;
@property (nonatomic, strong) UILabel *name_lab;
@property (nonatomic, strong) UILabel *info_lab;
@property (nonatomic, strong) UIButton *head_btn;
@property (nonatomic, strong) UIButton *guan_btn;
@property (nonatomic, strong) UIButton *btn0;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;

@end

@implementation SGKTalentListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = tableviewBgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.containView];
        [self.containView addSubview:self.name_lab];
        [self.containView addSubview:self.info_lab];
        [self.containView addSubview:self.head_btn];
        [self.containView addSubview:self.guan_btn];
        [self.containView addSubview:self.btn0];
        [self.containView addSubview:self.btn1];
        [self.containView addSubview:self.btn2];
        [self.containView addSubview:self.line];
        [self layout];
    }
    return self;
}

- (void)configureCell:(TalentListModel *)talent{
    [self.head_btn sd_setImageWithURL:[NSURL URLWithString:talent.avatar] forState:UIControlStateNormal];
    [self.btn0 sd_setImageWithURL:[NSURL URLWithString:talent.list[0].host_pic] forState:UIControlStateNormal];
    [self.btn1 sd_setImageWithURL:[NSURL URLWithString:talent.list[1].host_pic] forState:UIControlStateNormal];
    [self.btn2 sd_setImageWithURL:[NSURL URLWithString:talent.list[2].host_pic] forState:UIControlStateNormal];
    self.name_lab.text = talent.nick_name;
    self.info_lab.text = [NSString stringWithFormat:@"%@个教程 | %@条手工圈",talent.course_count,talent.opus_count];
}


- (void)layout{
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.containView.mas_left);
        make.right.mas_equalTo(self.containView.mas_right);
        make.top.mas_equalTo(self.containView.mas_bottom);
    }];
    
    [self.head_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containView.mas_top).offset(10);
        make.left.mas_equalTo(self.containView.mas_left).offset(10);
        make.height.width.mas_equalTo(52);
    }];
    
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.head_btn.mas_top);
        make.left.mas_equalTo(self.head_btn.mas_right).offset(10);
    }];
    
    [self.info_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.head_btn.mas_right).offset(10);
        make.top.mas_equalTo(self.head_btn.mas_centerY).offset(4);
    }];
    
    [self.guan_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.head_btn.mas_top).offset(8);
        make.right.mas_equalTo(self.containView.mas_right).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(70);
    }];
    
    [self.btn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containView.mas_left).offset(0.5);
        make.top.mas_equalTo(self.head_btn.mas_bottom).offset(8);
        make.height.width.mas_equalTo(self.btn1.mas_width);
    }];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.btn0.mas_right).offset(1);
        make.top.mas_equalTo(self.btn0.mas_top);
        make.height.width.mas_equalTo(self.btn2.mas_width);
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.btn1.mas_right).offset(1);
        make.top.mas_equalTo(self.btn1.mas_top);
        make.height.width.mas_equalTo(self.btn0.mas_width);
        make.right.mas_equalTo(self.containView.mas_right).offset(-0.5);
        make.bottom.mas_equalTo(self.containView.mas_bottom);
    }];
}

#pragma mark - getter setter

- (UIView *)containView{
    if (!_containView) {
        _containView = [UIView new];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

- (UILabel *)name_lab{
    if (!_name_lab) {
        _name_lab = [UILabel new];
        _name_lab.textColor = [UIColor blackColor];
        _name_lab.font = [UIFont systemFontOfSize:15];
    }
    return _name_lab;
}

- (UILabel *)info_lab{
    if (!_info_lab) {
        _info_lab = [UILabel new];
        _info_lab.textColor = [UIColor blackColor];
        _info_lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    }
    return _info_lab;
}

- (UIButton *)head_btn{
    if (!_head_btn) {
        _head_btn = [UIButton new];
        _head_btn.backgroundColor = [UIColor whiteColor];
        _head_btn.layer.shouldRasterize = YES;
        _head_btn.layer.cornerRadius = 26.0f;
        _head_btn.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _head_btn.layer.masksToBounds = YES;
        _head_btn.tag = -1;
    }
    return _head_btn;
}

- (UIButton *)guan_btn{
    if (!_guan_btn) {
        _guan_btn = [UIButton new];
        _guan_btn.backgroundColor = [UIColor whiteColor];
        _guan_btn.layer.shouldRasterize = YES;
        _guan_btn.layer.cornerRadius = 4.0f;
        _guan_btn.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _guan_btn.layer.borderColor = mainColor.CGColor;
        _guan_btn.layer.borderWidth = 1.0f;
        _guan_btn.tag = -2;
        [_guan_btn setTitle:@"关注" forState:UIControlStateNormal];
        [_guan_btn setTitleColor:mainColor forState:UIControlStateNormal];
    }
    return _guan_btn;
}

- (UIButton *)btn0{
    if (!_btn0) {
        _btn0 = [UIButton new];
        _btn0.backgroundColor = [UIColor whiteColor];
        _btn0.tag = 0;
    }
    return _btn0;
}

- (UIButton *)btn1{
    if (!_btn1) {
        _btn1 = [UIButton new];
        _btn1.backgroundColor = [UIColor whiteColor];
        _btn1.tag = 1;
    }
    return _btn1;
}

- (UIButton *)btn2{
    if (!_btn2) {
        _btn2 = [UIButton new];
        _btn2.backgroundColor = [UIColor whiteColor];
        _btn2.tag = 2;
    }
    return _btn2;
}

- (UIImageView *)level_imgView{
    if (!_level_imgView) {
        _level_imgView = [UIImageView new];
    }
    return _level_imgView;
}












@end



















