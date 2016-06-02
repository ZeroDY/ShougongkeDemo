//
//  SGKActivityDetailViewController.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/29.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

typedef void(^JionBtnChangeLayoutBlock)(NSInteger upOrDown);

typedef enum : NSUInteger {
    JionButtonLayoutUp,
    JionButtonLayoutDown,
} JionButtonLayout;

@interface SGKActivityDetailViewController : UIViewController

@property (nonatomic, copy) NSString *activityC_id;

- (void)changeLayout:(JionButtonLayout) upOrDown;

@end
