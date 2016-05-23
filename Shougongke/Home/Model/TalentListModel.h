
//
//  TalentListModel.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HandList;
@interface TalentListModel : NSObject


@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *tb_url;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *guan_status;

@property (nonatomic, copy) NSString *course_count;

@property (nonatomic, copy) NSString *course_time;

@property (nonatomic, copy) NSString *video_count;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, strong) NSArray<HandList *> *list;

@property (nonatomic, copy) NSString *opus_count;

@property (nonatomic, copy) NSString *is_daren;

@end
@interface HandList : NSObject

@property (nonatomic, copy) NSString *hand_id;

@property (nonatomic, copy) NSString *host_pic;

@end

