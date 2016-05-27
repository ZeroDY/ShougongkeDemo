//
//  SGKPicViewControllerDataModel.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKPicViewControllerDataModel.h"
#import "DYMenuDataModel.h"
#import "CourseCategory.h"

@implementation SGKPicViewControllerDataModel

+ (NSArray *)getMenuDataArray:(NSArray *)categoryArr{
    DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:@"全部分类" imgName:@"sgk_course_cate_all" imgUrl:nil];
    NSMutableArray *categorys = [NSMutableArray arrayWithObjects:model, nil];
    for (CourseCategory *category in categoryArr) {
        DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:category.cate_name imgName:nil imgUrl:category.cate_ico];
        [categorys addObject:model];
    }
    DYMenuDataModel *othermodel = [[DYMenuDataModel alloc]initWithTitle:@"其他分类" imgName:@"sgk_course_cate_other" imgUrl:nil];
    [categorys addObject:othermodel];
    
    DYMenuDataModel *model0 = [[DYMenuDataModel alloc]initWithTitle:@"一周" imgName:@"sgk_course_time_week" imgUrl:nil];
    DYMenuDataModel *model1 = [[DYMenuDataModel alloc]initWithTitle:@"一月" imgName:@"sgk_course_time_month" imgUrl:nil];
    DYMenuDataModel *model2 = [[DYMenuDataModel alloc]initWithTitle:@"全部教程" imgName:@"sgk_course_time_all" imgUrl:nil];
    NSArray *timeArr = @[model0, model1, model2];
    
    DYMenuDataModel *model10 = [[DYMenuDataModel alloc]initWithTitle:@"最热教程" imgName:@"sgk_course_sort_hot" imgUrl:nil];
    DYMenuDataModel *model11 = [[DYMenuDataModel alloc]initWithTitle:@"最新更新" imgName:@"sgk_course_sort_new" imgUrl:nil];
    DYMenuDataModel *model12 = [[DYMenuDataModel alloc]initWithTitle:@"评论最多" imgName:@"sgk_course_sort_comment" imgUrl:nil];
    DYMenuDataModel *model13 = [[DYMenuDataModel alloc]initWithTitle:@"收藏最多" imgName:@"sgk_course_sort_collect" imgUrl:nil];
    DYMenuDataModel *model14 = [[DYMenuDataModel alloc]initWithTitle:@"材料包有售" imgName:@"sgk_course_sort_material" imgUrl:nil];
    DYMenuDataModel *model15 = [[DYMenuDataModel alloc]initWithTitle:@"成品有售" imgName:@"sgk_course_sort_product" imgUrl:nil];
    NSArray *sortArr = @[model10, model11, model12, model13, model14, model15];
    
    return @[categorys,timeArr,sortArr];
}

@end
