//
//  DYMenu.h
//  iOSTestProject
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYMenuCollectionViewCell.h"
#import "DYMenuItem.h"

typedef void (^DYMenuSelectIndexBlock)(NSInteger itemIndex, NSInteger cellIndex);

@interface DYMenuView : UIView

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *deselectColor;

- (void)configureViewWith:(NSArray *)menuDataArray selectIndex:(DYMenuSelectIndexBlock)block;


@end
