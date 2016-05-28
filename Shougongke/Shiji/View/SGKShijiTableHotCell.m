//
//  SGKShijiTableHeaderCell.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKShijiTableHotCell.h"
#import "ShijiVCModel.h"

@interface SGKShijiTableHotCell()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIButton *btn0;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;

@property (nonatomic, strong) UILabel *label0;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;

@property (nonatomic, strong) UIImageView *imgView0;
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;
@property (nonatomic, strong) UIImageView *imgView3;

@end


@implementation SGKShijiTableHotCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.containerView];
        [self creatSubviews];
        [self layout];
    }
    return self;
}

- (void)configureCell:(NSArray *)array{
    ShijiHot *hot0 = array[0];
    self.label0.text = hot0.name;
    [self.imgView0 sd_setImageWithURL:[NSURL URLWithString:hot0.pic]];
    
    ShijiHot *hot1 = array[1];
    self.label1.text = hot1.name;
    [self.imgView1 sd_setImageWithURL:[NSURL URLWithString:hot1.pic]];
    
    ShijiHot *hot2 = array[2];
    self.label2.text = hot2.name;
    [self.imgView2 sd_setImageWithURL:[NSURL URLWithString:hot2.pic]];
    
    ShijiHot *hot3 = array[3];
    self.label3.text = hot3.name;
    [self.imgView3 sd_setImageWithURL:[NSURL URLWithString:hot3.pic]];
}

- (void)creatSubviews{
    self.label0 = [self creatLabel];
    self.label1 = [self creatLabel];
    self.label2 = [self creatLabel];
    self.label3 = [self creatLabel];
    
    self.imgView0 = [self creatImgView];
    self.imgView1 = [self creatImgView];
    self.imgView2 = [self creatImgView];
    self.imgView3 = [self creatImgView];
    
    self.btn0 = [self creatBtn:0];
    self.btn1 = [self creatBtn:1];
    self.btn2 = [self creatBtn:2];
    self.btn3 = [self creatBtn:3];
}
- (UIButton *)creatBtn:(NSInteger)tag{
    UIButton *btn = [UIButton new];
    btn.tag = tag;
    [self.containerView addSubview:btn];
    return btn;
}

- (UILabel *)creatLabel{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor darkGrayColor];
    [self.containerView addSubview:label];
    return label;
}
- (UIImageView *)creatImgView{
    UIImageView *imgView = [UIImageView new];
    [self.containerView addSubview:imgView];
    return imgView;
}

- (void)layout{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [self.btn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self.containerView);
        make.width.mas_equalTo(self.btn1.mas_width);
        make.height.mas_equalTo(110);
    }];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.btn0);
        make.left.mas_equalTo(self.btn0.mas_right);
        make.width.mas_equalTo(self.btn2.mas_width);
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.btn0);
        make.left.mas_equalTo(self.btn1.mas_right);
        make.width.mas_equalTo(self.btn3.mas_width);
    }];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.btn0);
        make.left.mas_equalTo(self.btn2.mas_right);
        make.width.mas_equalTo(self.btn0.mas_width);
        make.right.mas_equalTo(self.containerView.mas_right);
    }];
    
    [self.imgView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn0.mas_centerX);
        make.centerY.mas_equalTo(self.containerView.mas_centerY).offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    [self.imgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn1.mas_centerX);
        make.centerY.mas_equalTo(self.containerView.mas_centerY).offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    [self.imgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn2.mas_centerX);
        make.centerY.mas_equalTo(self.containerView.mas_centerY).offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    [self.imgView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn3.mas_centerX);
        make.centerY.mas_equalTo(self.containerView.mas_centerY).offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    
    
    [self.label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn0.mas_centerX);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-15);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn1.mas_centerX);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-15);
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn2.mas_centerX);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-15);
    }];
    
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.btn3.mas_centerX);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-15);
    }];
}

- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

@end
