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

static NSString *activityCollectViewCellIdentifier = @"SGKActivityCollectionViewCell";

@interface SGKActivityNewViewController ()

@property (nonatomic, strong) SGKCollectionViewControllerDelegate *collectionDelegate;
@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation SGKActivityNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatCollectionView];
}
- (void)viewWillAppear:(BOOL)animated{
    /**
     *	请求数据
     */
    [self getViewControllerDataModel];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)getViewControllerDataModel{
//    [DYNetworking getCoursePicListDataWithParam:self.dataModel.requestParamDic
//                                          block:^(NSArray *array) {
//                                              self.collectionDelegate.dataArray = array;
//                                              [self.collectionView reloadData];
//                                          } fail:^(NSError *error) {
//                                              
//                                          }];
}


- (void)creatCollectionView{
    self.collectionDelegate =
    [[SGKCollectionViewControllerDelegate alloc]initWithItems:nil
                                               cellIdentifier:activityCollectViewCellIdentifier
                                           configureCellBlock:^(SGKActivityCollectionViewCell *cell, id data) {
                                               [cell configuraCellWith:data];
                                           } selectCellBlock:^(NSIndexPath *index, id data) {
//                                               NSLog(@"----%@",data.subject);
                                           }];
    CGSize cellSize = CGSizeMake((SCREENWIDTH-30)/2.0f, (SCREENWIDTH-30)/2.0f+80);
    self.collectionDelegate.flowLayout.itemSize = cellSize;
    self.collectionDelegate.flowLayout.minimumLineSpacing = 10.0f;
    self.collectionDelegate.flowLayout.minimumInteritemSpacing = 10.0f;
    self.collectionDelegate.flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionDelegate.flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SGKActivityCollectionViewCell class]
            forCellWithReuseIdentifier:activityCollectViewCellIdentifier];
    self.collectionView.dataSource = self.collectionDelegate;
    self.collectionView.delegate = self.collectionDelegate;
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - getter setter

//- (SGKPicViewControllerDataModel *)dataModel{
//    if (!_dataModel) {
//        _dataModel = [[SGKPicViewControllerDataModel alloc]init];
//    }
//    return _dataModel;
//}

@end
