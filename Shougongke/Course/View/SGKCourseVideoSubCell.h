//
//  SGKCourseVideoSubCell.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTopic.h"
#import "CourseVideo.h"
#import "ShijiVCModel.h"

@interface SGKCourseVideoSubCell : UITableViewCell

- (void)configureCellWithTopic:(HomeTopic *)topic;

- (void)configureCellWithVideo:(CourseVideo *)video;

- (void)configureCellWithShijiTopic:(ShijiTopic *)shiji;
@end
