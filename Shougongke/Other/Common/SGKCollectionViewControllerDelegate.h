//
//  SGKCollectionViewControllerDataSource.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CollectionViewCellConfigureBlock)(id cell, id data);
typedef void (^CollectionViewCellSelectBlock)(NSIndexPath *index , id data);

@interface SGKCollectionViewControllerDelegate : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(CollectionViewCellConfigureBlock)configureCellBlock
    selectCellBlock:(CollectionViewCellSelectBlock)selectBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
