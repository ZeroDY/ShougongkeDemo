//
//  DYBannerView.h
//  DYCommonControl
//
//  Created by 周德艺 on 15/12/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//
/**
 *	轮播广告
 */




//@property (nonatomic, strong)UIColor *currentPageIndicatorTintColor;/**< 当前圆点颜色 */
//@property (nonatomic, strong)UIColor *pageIndicatorTintColor;/**< 其他圆点颜色 */
//
//
//
//  DYBannerView.h
//  DYBannerViewDemo
//
//  Created by GuinsooMBP on 15/8/29.
//  Copyright (c) 2015年 gaonan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYBannerView;
typedef NS_ENUM(NSInteger, DYBannerViewScrollDirection) {
    DYBannerViewScrollDirectionVertical,
    DYBannerViewScrollDirectionHorizontal
};

@protocol DYBannerViewDelegate <NSObject>
@required
/**
 *  加载图片的代理，由自己指定加载方式
 */
- (void)bannerImageView:(UIImageView *)imageView loadImage:(NSString *)nameOrUrl;
/**
 *  banner的点击回调
 */
- (void)bannerView:(DYBannerView *)bannerView didSelectAtIndex:(NSUInteger)index;
@end

@interface DYBannerView : UIView

@property (nonatomic, weak) id<DYBannerViewDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval interval; /**< 0s 不自动滚动 默认 2s*/
@property (nonatomic, assign) BOOL cycleEnabled;/**< 循环 默认 YES，NO 时默认关闭自滚动*/
@property (nonatomic, assign, getter=isScrollEnabled) BOOL scrollEnabled;/**< 是否支持手势滑动，默认 YES */
@property (nonatomic, assign) DYBannerViewScrollDirection scrollDirection;/**< 滚动方向DYBannerViewScrollDirectionHorizontal */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

/**
 *  banners数据源
 *
 *  @param imageArray url字符串数组
 */
- (void)configBannerWithDelegate:(id<DYBannerViewDelegate>)delegate
                          images:(NSArray *)imageArray;
//- (void)configBannerWithDelegate:(id<DYBannerViewDelegate>)delegate
//                          images:(NSArray *)imageArray
//                          titles:(NSArray *)titleArray;
@end
