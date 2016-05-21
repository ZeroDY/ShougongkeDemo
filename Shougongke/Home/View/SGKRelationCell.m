//
//  RelationTableViewCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/20.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKRelationCell.h"

@interface SGKRelationCell()

@property (nonatomic, strong) UIView *line;

@end

@implementation SGKRelationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.titleImageView];
        [self.contentView addSubview:self.subjectLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.otherLabel];
        [self.contentView addSubview:self.line];
        [self layout];
    }
    return self;
}

- (void)layout{

    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(49.0);
        make.width.mas_equalTo(49.0);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
    }];
    
    [self.subjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.titleImageView.mas_centerY).offset(-2);
    }];
    
    [self.otherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
        make.top.mas_equalTo(self.titleImageView.mas_centerY).offset(4);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.otherLabel.mas_left).offset(-6);
        make.top.mas_equalTo(self.titleImageView.mas_centerY).offset(2);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.titleImageView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];

}

#pragma mark -- getter setter
- (UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] init];
        _titleImageView.layer.shouldRasterize = YES;
        _titleImageView.layer.cornerRadius = 4.0f;
        _titleImageView.layer.masksToBounds = YES;
        _titleImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return _titleImageView;
}

- (UILabel *)subjectLabel{
    if (!_subjectLabel) {
        _subjectLabel = [[UILabel alloc] init];
//        _subjectLabel.textColor = [UIColor darkGrayColor];
        _subjectLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    }
    return _subjectLabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
    }
    return _titleLabel;
}

- (UILabel *)otherLabel{
    if (!_otherLabel) {
        _otherLabel = [[UILabel alloc] init];
//        _otherLabel.textColor = [UIColor darkGrayColor];
        _otherLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight];
    }
    return _otherLabel;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _line;
}


@end
