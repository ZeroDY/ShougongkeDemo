//
//  SGKActivityNewViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/29.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKActivityNewViewController.h"
#import "SGKCollectionViewControllerDelegate.h"
#import "SGKPicViewControllerDataModel.h"
#import "SGKActivityCollectionViewCell.h"
#import "DYNetworking+ActivityOpusHttpRequest.h"
#import "SGKRefreshHeader.h"

static NSString *activityCollectViewCellIdentifier = @"SGKActivityCollectionViewCell";

@interface SGKActivityNewViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SGKCollectionViewControllerDelegate *collectionDelegate;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation SGKActivityNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = tableviewBgColor;
    [self creatCollectionView];
    [self addRefresh];
}
- (void)viewWillAppear:(BOOL)animated{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)getViewControllerDataModel{
    [DYNetworking getActivityOpusDataWithParam:@{@"cid":self.cid,@"order":self.order}
                                       success:^(NSArray *array) {
                                           self.collectionDelegate.dataArray = array;
                                           [self.collectionView.mj_header endRefreshing];
                                           [self.collectionView reloadData];
                                       } fail:^(NSError *error) {
                                           [self.collectionView.mj_header endRefreshing];
                                       }];
}

- (void)addRefresh{
    self.collectionView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self getViewControllerDataModel];
    }];
}
/**
 *	 通过SGKCollectionViewControllerDelegate 配置 collectionView
 */
- (void)creatCollectionView{
    self.collectionDelegate =
    [[SGKCollectionViewControllerDelegate alloc]initWithItems:nil
                                               cellIdentifier:activityCollectViewCellIdentifier
                                           configureCellBlock:^(SGKActivityCollectionViewCell *cell, id data) {
                                               [cell configuraCellWith:data];
                                           } selectCellBlock:^(NSIndexPath *index, ActivityOpus *data) {
                                               NSLog(@"----%@",data.subject);//此处跳转活动作品
                                           }];
    //配置布局参数
    CGSize cellSize = CGSizeMake((SCREENWIDTH-30)/2.0f, (SCREENWIDTH-30)/2.0f+70);
    self.collectionDelegate.flowLayout.itemSize = cellSize;
    self.collectionDelegate.flowLayout.minimumLineSpacing = 10.0f;
    self.collectionDelegate.flowLayout.minimumInteritemSpacing = 10.0f;
    self.collectionDelegate.flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionDelegate.flowLayout];
    self.collectionView.backgroundColor = tableviewBgColor;
    [self.collectionView registerClass:[SGKActivityCollectionViewCell class]
            forCellWithReuseIdentifier:activityCollectViewCellIdentifier];
    self.collectionView.dataSource = self.collectionDelegate;
    self.collectionView.delegate = self.collectionDelegate;
    self.scrollView = self.collectionView;
    self.scrollView.delegate = self;
    
    [self.view addSubview:self.collectionView];
}

#pragma mark -- scroll delegate
/**
 *	判断上下滑动，回调控制 joinBtn 上下移动
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:self.collectionView].y;
    if (panTranslationY > 0) { //下滑趋势，显示
        self.block(JionButtonLayoutUp);
    }
    else if(panTranslationY < 0) {  //上滑趋势，隐藏
        self.block(JionButtonLayoutDown);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
