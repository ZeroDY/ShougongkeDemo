//
//  SGKCoursePicViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCoursePicViewController.h"
#import "DYMenuView.h"
#import "DYMenuCollectionViewCell.h"
#import "CourseCategory.h"
#import "SGKPicViewControllerDataModel.h"
#import "SGKCollectionViewControllerDelegate.h"
#import "DYNetworking+CoursePicListHttpRequest.h"
#import "SGKCoursePicCollectionViewCell.h"
#import "CoursePicListObject.h"

static NSString *picViewControllerCellIdentifier = @"SGKCoursePicCollectionViewCell";

@interface SGKCoursePicViewController ()

@property (nonatomic, copy) NSArray *menuDataArr;
@property (nonatomic, strong) DYMenuView *menuView;
@property (nonatomic, strong) SGKCollectionViewControllerDelegate *collectionDelegate;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *courseObjectArray;

@end

@implementation SGKCoursePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatCollectionView];
    [self.view addSubview:self.menuView];
}
- (void)viewWillAppear:(BOOL)animated{
    [DYNetworking getCoursePicListData:^(NSArray *array) {
        self.courseObjectArray = array;
        self.collectionDelegate.dataArray = array;
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        
    }];
    
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)creatCollectionView{
    self.collectionDelegate =
    [[SGKCollectionViewControllerDelegate alloc]initWithItems:nil
                                               cellIdentifier:picViewControllerCellIdentifier
                                           configureCellBlock:^(SGKCoursePicCollectionViewCell *cell, CoursePicListObject *data) {
                                               [cell configuraCellWith:data];
                                           } selectCellBlock:^(NSIndexPath *index,CoursePicListObject *data) {
                                               NSLog(@"----%@",data.subject);
                                           }];
    CGSize cellSize = CGSizeMake((SCREENWIDTH-30)/2.0f, (SCREENWIDTH-30)/2.0f+80);
    self.collectionDelegate.flowLayout.itemSize = cellSize;
    self.collectionDelegate.flowLayout.minimumLineSpacing = 10.0f;
    self.collectionDelegate.flowLayout.minimumInteritemSpacing = 10.0f;
    self.collectionDelegate.flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionDelegate.flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SGKCoursePicCollectionViewCell class]
            forCellWithReuseIdentifier:picViewControllerCellIdentifier];
    self.collectionView.dataSource = self.collectionDelegate;
    self.collectionView.delegate = self.collectionDelegate;
    [self.view addSubview:self.collectionView];
}

- (void)creatMenuView{
    if (self.menuDataArr) {
        [self.menuView configureViewWith:self.menuDataArr selectIndex:^(NSInteger itemIndex, NSInteger cellIndex) {
            NSLog(@"----%ld----%ld",itemIndex,cellIndex);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - getter setter

- (void)setCategoryArray:(NSArray *)categoryArray{
    _categoryArray = categoryArray;
    self.menuDataArr = [SGKPicViewControllerDataModel getMenuDataArray:categoryArray];
    [self creatMenuView];
}

- (DYMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[DYMenuView alloc]init];
        _menuView.deselectColor = [UIColor darkGrayColor];
    }
    return _menuView;
}

@end
