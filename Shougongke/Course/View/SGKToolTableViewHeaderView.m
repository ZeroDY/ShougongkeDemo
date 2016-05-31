//
//  SGKToolTableViewHeaderView.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKToolTableViewHeaderView.h"

@implementation SGKToolTableViewHeaderView


- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = tableviewBgColor;
        [self addSubview:self.title_lab];
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
    }];
}

- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.textColor = [UIColor darkGrayColor];
    }
    return _title_lab;
}

@end
