//
//  SGKCourseControllerTitleView.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCourseControllerTitleView.h"

@interface SGKCourseControllerTitleView ()

@property (nonatomic, strong) UIButton * previousBtn;
@property (nonatomic, strong) UIButton * currentBtn;
@property (nonatomic, strong) UIButton *picture_btn;
@property (nonatomic, strong) UIButton *video_btn;
@property (nonatomic, strong) UIButton *subject_btn;
@property (nonatomic, strong) NSMutableArray *btnArr;
@property (nonatomic, copy) TitleClickBlock titleClickBlock;

@end

@implementation SGKCourseControllerTitleView

- (instancetype)initWithFrame:(CGRect)frame block:(TitleClickBlock)block{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnArr = [NSMutableArray array];
        [self addSubview:self.picture_btn];
        [self addSubview:self.video_btn];
        [self addSubview:self.subject_btn];
        [self.btnArr addObject:self.picture_btn];
        [self.btnArr addObject:self.video_btn];
        [self.btnArr addObject:self.subject_btn];
        self.previousBtn = self.picture_btn;
        self.currentBtn = self.picture_btn;
        self.picture_btn.selected = YES;
        self.titleClickBlock = block;
        [self layout];
    }
    return self;
}


-(void)updateSelecterToolsIndex:(NSInteger )index
{
    UIButton *selectBtn = self.btnArr[index];
    [self changeSelectBtn:selectBtn];
}
/**
 *	点击回调
 */
-(void)titleClick:(UIButton *)sender
{
    self.titleClickBlock(sender);
}
/**
 *	改变选中状态
 */
-(void)changeSelectBtn:(UIButton *)btn
{
    self.previousBtn = self.currentBtn;
    self.currentBtn = btn;
    self.previousBtn.selected = NO;
    self.currentBtn.selected = YES;
}

#pragma mark - layout
- (void)layout{
    [self.video_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(66);
    }];
    
    UIView *lineLeft = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0.5);
            make.height.mas_equalTo(14);
            make.centerY.mas_equalTo(self.video_btn);
            make.right.mas_equalTo(self.video_btn.mas_left);
        }];
        view;
    });
    
    UIView *lineRight = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0.5);
            make.height.mas_equalTo(14);
            make.centerY.mas_equalTo(self.video_btn);
            make.left.mas_equalTo(self.video_btn.mas_right);
        }];
        view;
    });
    
    [self.picture_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.width.mas_equalTo(self.video_btn);
        make.right.mas_equalTo(lineLeft.mas_left);
    }];
    [self.subject_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.width.mas_equalTo(self.video_btn);
        make.left.mas_equalTo(lineRight.mas_right);
    }];
    
}

#pragma mark - getter and setter

- (UIButton *)picture_btn{
    if (!_picture_btn) {
        _picture_btn = [UIButton new];
        _picture_btn.tag = 0;
        [_picture_btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_picture_btn setTitle:@"图文" forState:UIControlStateNormal];
        _picture_btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_picture_btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateNormal];
        [_picture_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return _picture_btn;
}

- (UIButton *)video_btn{
    if (!_video_btn) {
        _video_btn = [UIButton new];
        _video_btn.tag = 1;
        [_video_btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_video_btn setTitle:@"视频" forState:UIControlStateNormal];
        _video_btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_video_btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateNormal];
        [_video_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return _video_btn;
}

- (UIButton *)subject_btn{
    if (!_subject_btn) {
        _subject_btn = [UIButton new];
        _subject_btn.tag = 2;
        [_subject_btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_subject_btn setTitle:@"专题" forState:UIControlStateNormal];
        _subject_btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_subject_btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateNormal];
        [_subject_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return _subject_btn;
}

@end
