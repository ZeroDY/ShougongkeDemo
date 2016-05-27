//
//  SGKCourseVideoSubCell.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicObject.h"
#import "CourseVideo.h"

@interface SGKCourseVideoSubCell : UITableViewCell

- (void)configureCellWithTopic:(TopicObject *)topic;

- (void)configureCellWithVideo:(CourseVideo *)video;
@end
