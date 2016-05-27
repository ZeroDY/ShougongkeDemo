//
//  CourseVideo.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseVideo : NSObject


@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *host_pic;

@property (nonatomic, copy) NSString *subject;

@property (nonatomic, assign) NSInteger deadline;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger suggest;

@property (nonatomic, assign) NSInteger is_free;


@end
