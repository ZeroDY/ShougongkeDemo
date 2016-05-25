//
//  SGKHotTopicCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKHotTopicCell.h"

@interface SGKHotTopicCell ()

@property (nonatomic, strong) UIImageView *bg_imgView;
@property (nonatomic, strong) UIView *title_view;
@property (nonatomic, strong) UILabel *title_lab;

@end

@implementation SGKHotTopicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.bg_imgView];
        [self.contentView addSubview:self.title_view];
        [self.title_view addSubview:self.title_lab];
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.bg_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 0, 0, 0));
        make.height.mas_equalTo(200);
    }];
    
    [self.title_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.bg_imgView);
        make.height.mas_equalTo(40);
    }];
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.title_view.mas_centerY);
        make.left.mas_equalTo(self.bg_imgView.mas_left).offset(10);
    }];
}

#pragma mark - getter setter

- (void)setTopic:(TopicObject *)topic{
    _topic = topic;
    [self.bg_imgView sd_setImageWithURL:[NSURL URLWithString:topic.pic]];
    self.title_lab.text = topic.subject;
}

- (UIImageView *)bg_imgView{
    if (!_bg_imgView) {
        _bg_imgView = [UIImageView new];
    }
    return _bg_imgView;
}

- (UIView *)title_view{
    if (!_title_view) {
        _title_view = [UIView new];
        _title_view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
    }
    return _title_view;
}

- (UILabel *)title_lab{
    if (!_title_lab) {
        _title_lab = [UILabel new];
        _title_lab.textColor = [UIColor whiteColor];
        _title_lab.font = [UIFont systemFontOfSize:15];
    }
    return _title_lab;
}







@end
