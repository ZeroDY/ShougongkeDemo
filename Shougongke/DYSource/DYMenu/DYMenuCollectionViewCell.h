//
//  DYMenuCollectionViewCell.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMenuView.h"
#import "DYMenuDataModel.h"

@interface DYMenuCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *titleImgView;
@property (nonatomic, strong) UILabel *title_lab;

- (void)configuraCellWith:(DYMenuDataModel *)model;

@end