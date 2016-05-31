//
//  CourseDetail.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "CourseDetail.h"

@implementation CourseDetail

+ (NSDictionary *)objectClassInArray{
    return @{
             @"material" : [CourseDetailMaterial class],
             @"opus" : [CourseDetailOpus class],
             @"comment_list" : [CourseDetailComment class],
             @"maybe_like" : [CourseMaybeLike class],
             @"step" : [CourseDetailStep class],
             @"tools" : [CourseDetailTools class]
             };
}

@end


@implementation CourseDetailGcates

@end


@implementation CourseDetailMaterial

@end


@implementation CourseDetailOpus

@end


@implementation CourseDetailComment

@end


@implementation CourseMaybeLike

@end


@implementation CourseDetailStep

@end


@implementation CourseDetailTools

@end


