//
//  DYSegmentControlView.m
//  TestProject
//
//  Created by 周德艺 on 16/5/24.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYSegmentContainerlView.h"
#import "Masonry.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface DYSegmentContainerlView ()<UIScrollViewDelegate>

@property (nonatomic, copy) NSArray *viewControllerArr;
@property (nonatomic, copy) ScrollPage scrollPage;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *lastView;

@end

@implementation DYSegmentContainerlView

-(instancetype)initWithSeleterConditionTitleArr:(NSArray *)vcArr andBtnBlock:(ScrollPage)page
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.scrollPage = page;
        [self addSubview:self.containerView];
        self.viewControllerArr = vcArr;
        [self layout];
    }
    return self;
}

- (void)layout{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.equalTo(self.mas_height);
    }];
    
    UIView *lastView = nil;
    
    for (UIViewController *viewController in self.viewControllerArr) {
        [self.containerView addSubview:viewController.view];
        [viewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width);
            make.top.bottom.mas_equalTo(self.containerView);
            if (lastView) {
                make.left.mas_equalTo(lastView.mas_right);
            }else{
                make.left.mas_equalTo(self.containerView.mas_left);
            }
        }];
        lastView = viewController.view;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.containerView.mas_right);
    }];
}

-(void)updateVCViewFromIndex:(NSInteger )index
{
    [self setContentOffset:CGPointMake(index*WIDTH, 0) animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x+WIDTH/2)/WIDTH;
    self.scrollPage(page);
}

- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
    }
    return _containerView;
}

@end
