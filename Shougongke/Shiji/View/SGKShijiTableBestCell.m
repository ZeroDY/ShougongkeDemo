//
//  SGKShijiTableSaleCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiTableBestCell.h"
#import "SaleCellItem.h"

@interface SGKShijiTableBestCell()

@property (nonatomic, strong) SaleCellItem *item0;
@property (nonatomic, strong) SaleCellItem *item1;
@property (nonatomic, strong) SaleCellItem *item2;

@end

@implementation SGKShijiTableBestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.item0 = [SaleCellItem new];
        self.item1 = [SaleCellItem new];
        self.item2 = [SaleCellItem new];
        [self.contentView addSubview:self.item0];
        [self.contentView addSubview:self.item1];
        [self.contentView addSubview:self.item2];
        [self layout];
    }
    return self;
}

- (void)configureCell:(NSArray *)array{
    [self.item0 configureItem:array[0]];
    [self.item1 configureItem:array[1]];
    [self.item2 configureItem:array[2]];
}

- (void)layout{
    [self.item0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(self.item1);
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
