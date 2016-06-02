//
//  SGKUserTableViewFirstCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKUserTableViewFirstCell.h"

@interface SGKUserTableViewFirstCell ()

@property (nonatomic, strong) UIImageView *headImgView;

@end

@implementation SGKUserTableViewFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.name_lab];
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.contentView);
    }];
}


- (UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.image = [UIImage imageNamed:@"head"];
    }
    return _headImgView;
}

- (UILabel *)name_lab{
    if (!_name_lab) {
        _name_lab = [UILabel new];
        _name_lab.textColor = [UIColor darkGrayColor];
    }
    return _name_lab;
}

@end
