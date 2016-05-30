//
//  SGKActivityCollectionViewCell.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityOpus.h"

@interface SGKActivityCollectionViewCell : UICollectionViewCell

- (void)configuraCellWith:(ActivityOpus *)model;

@end
