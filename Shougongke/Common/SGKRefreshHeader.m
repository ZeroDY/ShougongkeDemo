//
//  SGKRefreshHeader.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKRefreshHeader.h"

@implementation SGKRefreshHeader

+ (instancetype)addRefreshHeaderWithRrefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    SGKRefreshHeader *header = [SGKRefreshHeader headerWithRefreshingBlock:refreshingBlock];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.font = [UIFont systemFontOfSize:11];
    header.stateLabel.textColor = [UIColor lightGrayColor];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"小客正在刷新" forState:MJRefreshStateRefreshing];
    [header beginRefreshing];
    return header;
}

- (void)prepare
{
    [super prepare];
    // 设置控件的高度
    self.mj_h = 48;
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh00%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh00%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.gifView.constraints.count) return;
    
    self.gifView.frame = self.bounds;
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeRight;
        self.gifView.mj_w = self.mj_w * 0.5 - 40;
    }
}

@end
