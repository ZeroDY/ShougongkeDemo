//
//  DYSegmentControllerView.m
//  TestProject
//
//  Created by 周德艺 on 16/5/24.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYSegmentControllerView.h"
#import "Masonry.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DYSegmentControllerView()

@property (nonatomic, assign) DYSementStyle style;
@property (nonatomic, copy) BtnClick btnClick;

@property (nonatomic, strong) NSMutableArray *btnArr;
@property (nonatomic, strong) UIButton * previousBtn;
@property (nonatomic, strong) UIButton * currentBtn;
@property (nonatomic, strong) UIView *containView;

@property(nonatomic,retain)UIView *bottomLine;
@end

@implementation DYSegmentControllerView

- (instancetype)initWithStyle:(DYSementStyle)style{
    self = [super init];
    if (self) {
        [self addSubview:self.containView];
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.style = style;
    }
    return self;
}

- (void)setTitleArr:(NSArray *)titleArr andBtnBlock:(BtnClick)btnClick{
    [self addSubview:self.containView];
    self.btnArr = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        UIButton *titleBtn = [[UIButton alloc]init];
        titleBtn.tag = i;
        [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        titleBtn.titleLabel.font = self.titleFont;
        [titleBtn setTitleColor:self.unselectedColor forState:UIControlStateNormal];
        [titleBtn setTitleColor:self.selectedColor forState:UIControlStateSelected];
        [self.containView addSubview:titleBtn];
        [self.btnArr addObject:titleBtn];
        if (i == 0) {
            self.previousBtn = titleBtn;
            self.currentBtn = titleBtn;
            titleBtn.selected = YES;
        }
    }
    self.bottomLine = [UIView new];
    self.bottomLine.backgroundColor = self.selectedColor;
    [self.containView addSubview:self.bottomLine];
    self.btnClick = btnClick;
    [self layout];
}

- (void)layout{
    switch (self.style) {
        case DYSementStyleDefault:{
            [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
                make.height.mas_equalTo(self.mas_height);
            }];
            
            [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(2);
                make.bottom.mas_equalTo(self.containView.mas_bottom);
                make.centerX.mas_equalTo(self.currentBtn.mas_centerX);
                make.width.mas_equalTo(self.currentBtn.mas_width);
            }];
            UIButton *lastBtn = nil;
            for (UIButton *btn in self.btnArr) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(self.containView.mas_centerY);
                    if (lastBtn) {
                        make.left.mas_equalTo(lastBtn.mas_right).offset(self.space);
                    }else{
                        make.left.mas_equalTo(self.containView.mas_left).offset(self.space);
                    }
                }];
                lastBtn = btn;
            }
            [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(lastBtn.mas_right).offset(self.space);
            }];
            break;
        }
        case DYSementStyleWidthEqual:{
            [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
                make.height.mas_equalTo(self.mas_height);
            }];
            
            [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(2);
                make.bottom.mas_equalTo(self.containView.mas_bottom);
                make.centerX.mas_equalTo(self.currentBtn.mas_centerX);
                
                if (self.lineWidth>0) {
                    make.width.mas_equalTo(self.lineWidth);
                }else{
                    make.width.mas_equalTo(self.currentBtn.mas_width);
                }
            }];
            UIButton *lastBtn = nil;
            for (UIButton *btn in self.btnArr) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(self.containView.mas_centerY);
                    make.width.mas_equalTo(self.buttonWidth);
                    if (lastBtn) {
                        make.left.mas_equalTo(lastBtn.mas_right).offset(self.space);
                    }else{
                        make.left.mas_equalTo(self.containView.mas_left).offset(self.space);
                    }
                    
                }];
                lastBtn = btn;
            }
            [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(lastBtn.mas_right).offset(self.space);
            }];
            break;
        }
        case DYSementStyleWidthEqualFull:{
            [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
                make.height.width.mas_equalTo(self);
            }];
            
            [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(2);
                make.bottom.mas_equalTo(self.containView.mas_bottom);
                make.centerX.mas_equalTo(self.currentBtn.mas_centerX);
                if (self.lineWidth>0) {
                    make.width.mas_equalTo(self.lineWidth);
                }else{
                    make.width.mas_equalTo(self.currentBtn.mas_width);
                }
            }];
            UIButton *lastBtn = nil;
            for (UIButton *btn in self.btnArr) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(self.containView.mas_centerY);
                    if (lastBtn) {
                        make.left.mas_equalTo(lastBtn.mas_right).offset(self.space);
                        make.width.mas_equalTo(lastBtn.mas_width);
                    }else{
                        make.left.mas_equalTo(self.containView.mas_left).offset(self.space);
                    }
                }];
                lastBtn = btn;
            }
            [lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.containView.mas_right).offset(-self.space);
            }];
            break;
        }
        default:
            break;
    }
    
}

-(void)updateSelecterToolsIndex:(NSInteger )index
{
    UIButton *selectBtn = self.btnArr[index];
    [self changeSelectBtn:selectBtn];
}

-(void)btnClick:(UIButton *)sender
{
    self.btnClick(sender);
}

-(void)changeSelectBtn:(UIButton *)btn
{
    
    self.previousBtn = self.currentBtn;
    self.currentBtn = btn;
    self.previousBtn.selected = NO;
    self.currentBtn.selected = YES;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bottomLine.center = CGPointMake(self.currentBtn.center.x, self.bottomLine.center.y);
        if (self.style == DYSementStyleDefault) {
            self.bottomLine.frame = CGRectMake(self.bottomLine.frame.origin.x, self.bottomLine.frame.origin.y, self.currentBtn.frame.size.width, 2);
        }
    } completion:^(BOOL finished) {
        
    }];
    if (self.currentBtn.center.x<WIDTH/2) {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else if (self.currentBtn.center.x>self.contentSize.width-WIDTH/2) {
        [self setContentOffset:CGPointMake(self.contentSize.width-WIDTH, 0) animated:YES];
    }
    else {
        [self setContentOffset:CGPointMake(btn.center.x-WIDTH/2, 0) animated:YES];
    }
    
}

#pragma mark - getter setter

- (UIColor *)selectedColor{
    if (!_selectedColor) {
        _selectedColor = [UIColor redColor];
    }
    return _selectedColor;
}

- (UIColor *)unselectedColor{
    if (!_unselectedColor) {
        _unselectedColor = [UIColor blackColor];
    }
    return _unselectedColor;
}

- (UIFont *)titleFont{
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:13];
    }
    return _titleFont;
}

- (CGFloat)space{
    if (!_space) {
        _space = 20;
    }
    return _space;
}

- (CGFloat)buttonWidth{
    if (!_buttonWidth) {
        _buttonWidth = 60;
    }
    return _buttonWidth;
}

- (UIView *)containView{
    if (!_containView) {
        _containView = [UIView new];
    }
    return _containView;
}


@end
