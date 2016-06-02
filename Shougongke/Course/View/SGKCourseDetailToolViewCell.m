//
//  SGKCourseDetailToolViewCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseDetailToolViewCell.h"

@interface SGKCourseDetailToolViewCell ()

@property (nonatomic, strong) UILabel *name_lab;
@property (nonatomic, strong) UILabel *num_lab;

@end

@implementation SGKCourseDetailToolViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.name_lab];
        [self.contentView addSubview:self.num_lab];
        [self layout];
    }
    return self;
}

- (void)configureCell:(id)model{
    if ([model isKindOfClass:[CourseDetailMaterial class]]) {
        CourseDetailMaterial *materialModel = (CourseDetailMaterial *)model;
        self.name_lab.text = materialModel.name;
        self.num_lab.text = materialModel.num;
    }else{
        CourseDetailTools *toolModel = (CourseDetailTools *)model;
        self.name_lab.text = toolModel.name;
        self.num_lab.text = toolModel.num;
    }
}


- (void)layout{
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).offset(12);
    }];
    UIView *line = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0.5);
            make.top.centerX.bottom.mas_equalTo(self.contentView);
        }];
        view;
    });
    [self.num_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(line.mas_left).offset(12);
    }];
}

- (UILabel *)name_lab{
    if (!_name_lab) {
        _name_lab = [UILabel new];
        _name_lab.font = [UIFont systemFontOfSize:15];
    }
    return _name_lab;
}

- (UILabel *)num_lab{
    if (!_num_lab) {
        _num_lab = [UILabel new];
        _num_lab.font = [UIFont systemFontOfSize:15];
    }
    return _num_lab;
}

@end
