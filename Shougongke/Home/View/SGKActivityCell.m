//
//  SGKActivityCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKActivityCell.h"
#import "Activity.h"

@interface SGKActivityCell()

@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) UIImageView *title_imgView;
@property (nonatomic, strong) UILabel *title_lab;
@property (nonatomic, strong) UILabel *time_lab;
@property (nonatomic, strong) UILabel *status_lab;
@property (nonatomic, strong) UIView *line;

@end

@implementation SGKActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = tableviewBgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.containView];
        [self.containView addSubview:self.title_imgView];
        [self.containView addSubview:self.title_lab];
        [self.containView addSubview:self.time_lab];
        [self.containView addSubview:self.status_lab];
        [self.contentView addSubview:self.line];
        [self layout];
    }
    return self;
}

- (void)configureCell:(Activity *)activity{
    [self.title_imgView sd_setImageWithURL:[NSURL URLWithString:activity.m_logo] placeholderImage:[UIImage imageNamed:@"activity_bg"]];
    self.title_lab.text = activity.c_name;
    self.time_lab.text = [NSString stringWithFormat:@"征集作品时间:%@",activity.c_time];
    self.status_lab.text = [activity.c_status integerValue] == 1 ? @"进行中":@"已结束";
}

- (void)layout{
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.containView.mas_left);
        make.right.mas_equalTo(self.containView.mas_right);
        make.bottom.mas_equalTo(self.containView.mas_bottom);
    }];
    
    [self.title_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containView.mas_top);
        make.left.mas_equalTo(self.containView.mas_left);
        make.right.mas_equalTo(self.containView.mas_right);
        make.height.mas_equalTo(self.contentView.mas_width).multipliedBy(0.36);
    }];
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title_imgView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.containView.mas_left).offset(10);
        make.right.mas_equalTo(self.containView.mas_right).offset(-10);
    }];
    
    [self.status_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title_lab.mas_bottom).offset(6);
        make.right.mas_equalTo(self.containView.mas_right).offset(-10);
    }];
    
    [self.time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title_lab.mas_bottom).offset(6);
        make.left.mas_equalTo(self.containView.mas_left).offset(10);
        make.right.mas_equalTo(self.status_lab.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.containView.mas_bottom).offset(-10);
    }];
    
}

- (UIView *)containView{
    if (!_containView) {
        _containView = [UIView new];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}

- (UIImageView *)title_imgView{
    if (!_title_imgView) {
        _title_imgView = [UIImageView new];
        _title_imgView.contentMode = UIViewContentModeScaleToFill;
    }
    return _title_imgView;
}

- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.font = [UIFont systemFontOfSize:14];
        _title_lab.textColor = [UIColor darkGrayColor];
    }
    return _title_lab;
}

- (UILabel *)time_lab{
    if (!_time_lab) {
        _time_lab = [UILabel new];
        _time_lab.font = [UIFont systemFontOfSize:14];
        _time_lab.text = @"征集作品时间:";
        _time_lab.textColor = [UIColor darkGrayColor];
    }
    return _time_lab;
}

- (UILabel *)status_lab{
    if (!_status_lab) {
        _status_lab = [UILabel new];
        _status_lab.font = [UIFont systemFontOfSize:14];
        _status_lab.textColor = [UIColor blackColor];
    }
    return _status_lab;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}







@end
