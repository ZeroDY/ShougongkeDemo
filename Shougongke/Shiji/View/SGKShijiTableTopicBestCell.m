//
//  SGKShijiTablePerfectCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiTableTopicBestCell.h"

@interface SGKShijiTableTopicBestCell()

@property (nonatomic, strong) UIImageView *item0;
@property (nonatomic, strong) UIImageView *item1;
@property (nonatomic, strong) UIImageView *item2;

@end

@implementation SGKShijiTableTopicBestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.item0 = [UIImageView new];
        self.item1 = [UIImageView new];
        self.item2 = [UIImageView new];
        [self.contentView addSubview:self.item0];
        [self.contentView addSubview:self.item1];
        [self.contentView addSubview:self.item2];
        [self layout];
    }
    return self;
}

- (void)configureCell:(NSArray *)array{
    [self.item0 sd_setImageWithURL:[NSURL URLWithString:array[0]]];
    [self.item1 sd_setImageWithURL:[NSURL URLWithString:array[1]]];
    [self.item2 sd_setImageWithURL:[NSURL URLWithString:array[2]]];
}

- (void)layout{
    NSInteger height = (SCREENWIDTH-40)/3;
    [self.item0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(self.item1);
        make.height.mas_equalTo(height);
    }];
    [self.item1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.item0.mas_right).offset(10);
        make.width.mas_equalTo(self.item2);
    }];
    [self.item2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.item1.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
    }];
}
@end
