//
//  TalentObject.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/21.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LevelObject;
@interface Talent : NSObject


@property (nonatomic, copy) NSString *videocollect;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *openIm_id;

@property (nonatomic, copy) NSString *uname;

@property (nonatomic, copy) NSString *coursecollect;

@property (nonatomic, copy) NSString *fen_num;

@property (nonatomic, copy) NSString *region;

@property (nonatomic, assign) NSInteger hand_teacher;

@property (nonatomic, copy) NSString *circle_count;

@property (nonatomic, copy) NSString *coursedraft;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, strong) LevelObject *level;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *videocount;

@property (nonatomic, copy) NSString *guan_num;

@property (nonatomic, copy) NSString *guan_status;

@property (nonatomic, copy) NSString *coursecount;

@property (nonatomic, copy) NSString *daren;

@property (nonatomic, copy) NSString *tb_url;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *bg_image;

@property (nonatomic, copy) NSString *openIm_password;

@property (nonatomic, copy) NSString *circle_collect_count;


@end


@interface LevelObject : NSObject

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *integral;

@property (nonatomic, copy) NSString *experience;

@property (nonatomic, copy) NSString *next_level_need;

@end

