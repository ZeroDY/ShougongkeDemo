//
//  CourseCategry.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "CourseCategory.h"

@implementation CourseCategory

+ (NSDictionary *)objectClassInArray{
    return @{@"tools" : [CourseTools class], @"material" : [CourseMaterial class]};
}
@end
@implementation CourseTools

@end


@implementation CourseMaterial

@end


