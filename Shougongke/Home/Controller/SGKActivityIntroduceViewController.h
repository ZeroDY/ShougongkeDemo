//
//  SGKActivityIntroduceViewController.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/29.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGKActivityDetailViewController.h"

@interface SGKActivityIntroduceViewController : UIViewController

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, copy) JionBtnChangeLayoutBlock block;

@end
