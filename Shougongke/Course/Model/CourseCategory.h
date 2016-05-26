//
//  CourseCategry.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CourseTools,CourseMaterial;
@interface CourseCategory : NSObject


@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic, strong) NSArray<CourseMaterial *> *material;

@property (nonatomic, copy) NSString *cate_name;

@property (nonatomic, copy) NSString *ico;

@property (nonatomic, copy) NSString *cate_ico;

@property (nonatomic, strong) NSArray<CourseTools *> *tools;


@end
@interface CourseTools : NSObject

@property (nonatomic, copy) NSString *tools_name;

@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic, copy) NSString *tools_id;

@end

@interface CourseMaterial : NSObject

@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic, copy) NSString *material_name;

@property (nonatomic, copy) NSString *material_id;

@end

