//
//  DYSegmentControlView.h
//  TestProject
//
//  Created by 周德艺 on 16/5/24.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ScrollPage)(int);

@interface DYSegmentContainerlView : UIScrollView

- (void)updateVCViewFromIndex:(NSInteger )index;

- (instancetype)initWithSeleterConditionTitleArr:(NSArray *)vcArr andBtnBlock:(ScrollPage)page;



@end
