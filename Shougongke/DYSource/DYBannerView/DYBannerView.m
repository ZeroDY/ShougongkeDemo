//
//  DYBannerView.m
//  DYCommonControl
//
//  Created by 周德艺 on 15/12/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYBannerView.h"
#import "DYBannerCollectionViewCell.h"
@interface DYBannerView ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UICollectionView *bannerCollectionView;
@property (nonatomic, strong) UIPageControl *pageController;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) CGFloat unitLength;
@property (nonatomic, assign) CGFloat offsetLength;
@property (nonatomic, assign) CGFloat contentLength;
@property (nonatomic, assign) CGFloat oldOffsetLength;

@end
@implementation DYBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.flowLayout.itemSize = self.frame.size;
}

#pragma mark - public method
- (void)configBannerWithDelegate:(id<DYBannerViewDelegate>)delegate
                          images:(NSArray *)imageArray
                          titles:(NSArray *)titleArray {
    self.delegate = delegate;
    self.imageArray = imageArray;
    self.titleArray = titleArray;
    self.pageController.numberOfPages = imageArray.count;
    [self.bannerCollectionView reloadData];
}
- (void)configBannerWithDelegate:(id<DYBannerViewDelegate>)delegate
                          images:(NSArray *)imageArray{
    self.delegate = delegate;
    self.imageArray = imageArray;
    self.pageController.numberOfPages = imageArray.count;
    [self.bannerCollectionView reloadData];
}

#pragma mark - private method
- (void)initSubviews {
    [self addSubview:self.bannerCollectionView];
    [self addSubview:self.pageController];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_bannerCollectionView]-0-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_bannerCollectionView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_bannerCollectionView]-0-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_bannerCollectionView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_pageController]-|" options:NSLayoutFormatAlignAllCenterX metrics:0 views:NSDictionaryOfVariableBindings(_pageController)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_pageController]-0-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_pageController)]];
    self.scrollEnabled = YES;
    self.cycleEnabled = YES;
    self.interval = 2.6;
    self.scrollDirection = DYBannerViewScrollDirectionHorizontal;
}

- (void)addTimer {
    if (self.interval == 0) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)changePage {
    
    CGFloat newOffSetLength = self.offsetLength + self.unitLength;
    //在换页到最后一个的时候多加一点距离，触发回到第一个图片的事件
    if (newOffSetLength == self.contentLength - self.unitLength) {
        newOffSetLength += 0.5;
    }
    CGPoint offSet;
    if (self.scrollDirection == DYBannerViewScrollDirectionHorizontal) {
        offSet = CGPointMake(newOffSetLength, 0);
    }else{
        offSet = CGPointMake(0,newOffSetLength);
    }
    [self.bannerCollectionView setContentOffset:offSet  animated:YES];
    
}

- (NSString *)getImageUrlForIndexPath:(NSIndexPath *)indexPath {
    if (!(self.imageArray.count > 0)) {
        return nil;
    }
    if (indexPath.row == self.imageArray.count){
        return self.imageArray.firstObject;
    } else {
        return self.imageArray[indexPath.row];
    }
}

#pragma mark - collectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DYBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DYBannerCell" forIndexPath:indexPath];
    NSString *nameOrUrl = [self getImageUrlForIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(bannerImageView:loadImage:)]) {
        [self.delegate bannerImageView:cell.imageView loadImage:nameOrUrl];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(bannerView:didSelectAtIndex:)]) {
        [self.delegate bannerView:self didSelectAtIndex:self.pageController.currentPage];
    }
}

#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.pageController.currentPage = self.offsetLength / self.unitLength;
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    
    if (self.oldOffsetLength > self.offsetLength) {
        if (self.offsetLength < 0)
        {
            if (self.cycleEnabled) {
                [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
            }else{
                [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
            }
        }
    }else{
        if (self.cycleEnabled) {
            if (self.offsetLength > self.contentLength - self.unitLength) {
                [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
            }
        }else{
            if (self.offsetLength > self.contentLength - 2*self.unitLength) {
                [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageArray.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
            }
        }
        
    }
    self.pageController.currentPage = self.offsetLength / self.unitLength;
    self.oldOffsetLength = self.offsetLength;
    if (self.oldOffsetLength == self.contentLength - self.unitLength){
        self.pageController.currentPage = 0;
    }
    
    
}

#pragma mark - setter && getter
- (UICollectionView *)bannerCollectionView {
    if (!_bannerCollectionView) {
        _bannerCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _bannerCollectionView.dataSource = self;
        _bannerCollectionView.delegate = self;
        _bannerCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_bannerCollectionView registerClass:[DYBannerCollectionViewCell class] forCellWithReuseIdentifier:@"DYBannerCell"];
        _bannerCollectionView.pagingEnabled = YES;
        _bannerCollectionView.showsHorizontalScrollIndicator = NO;
        _bannerCollectionView.showsVerticalScrollIndicator = NO;
    }
    return _bannerCollectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UIPageControl *)pageController {
    if (!_pageController) {
        _pageController = [[UIPageControl alloc] init];
        _pageController.currentPage = 0;
        _pageController.numberOfPages = self.imageArray.count;
        _pageController.backgroundColor = [UIColor clearColor];
        _pageController.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
        _pageController.pageIndicatorTintColor = self.pageIndicatorTintColor;
        _pageController.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return  _pageController;
}

- (void)setScrollDirection:(DYBannerViewScrollDirection)scrollDirection {
    if (_scrollDirection != scrollDirection) {
        _scrollDirection = scrollDirection;
        if (scrollDirection == DYBannerViewScrollDirectionVertical) {
            self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        }else{
            self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
        [self.bannerCollectionView reloadData];
    }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    self.bannerCollectionView.scrollEnabled = _scrollEnabled;
}

- (void)setCycleEnabled:(BOOL)cycleEnabled{
    _cycleEnabled = cycleEnabled;
    if (!cycleEnabled) {
        self.interval = 0;
    }
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    self.pageController.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    self.pageController.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (CGFloat)unitLength {
    return self.scrollDirection == DYBannerViewScrollDirectionHorizontal ? CGRectGetWidth(self.frame) : CGRectGetHeight(self.frame);
}

- (CGFloat)offsetLength {
    return self.scrollDirection == DYBannerViewScrollDirectionHorizontal ? self.bannerCollectionView.contentOffset.x : self.bannerCollectionView.contentOffset.y;
}

- (CGFloat)contentLength {
    return self.scrollDirection == DYBannerViewScrollDirectionHorizontal ? self.bannerCollectionView.contentSize.width : self.bannerCollectionView.contentSize.height;
}
- (void)setInterval:(NSTimeInterval)interval {
    _interval = interval;
    [self removeTimer];
    if (interval != 0) {
        [self addTimer];
    }
}


@end
