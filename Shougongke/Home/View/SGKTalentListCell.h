//
//  SGKTalentListCell.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalentListModel.h"

typedef void(^ClickCourseBlock)(NSInteger index);

@interface SGKTalentListCell : UITableViewCell

- (void)configureCell:(TalentListModel *)talent clickBlock:(ClickCourseBlock) click;

@end
