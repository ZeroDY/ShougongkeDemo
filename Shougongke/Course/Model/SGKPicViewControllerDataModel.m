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
//    DYMenuDataModel *othermodel = [[DYMenuDataModel alloc]initWithTitle:@"其他分类" imgName:@"sgk_course_cate_other" imgUrl:nil];
//    [categorys addObject:othermodel];
    
    DYMenuDataModel *model0 = [[DYMenuDataModel alloc]initWithTitle:@"一周" imgName:@"sgk_course_time_week" imgUrl:nil];
    DYMenuDataModel *model1 = [[DYMenuDataModel alloc]initWithTitle:@"一月" imgName:@"sgk_course_time_month" imgUrl:nil];
    DYMenuDataModel *model2 = [[DYMenuDataModel alloc]initWithTitle:@"全部教程" imgName:@"sgk_course_time_all" imgUrl:nil];
    NSArray *timeArr = @[model0, model1, model2];
    
    DYMenuDataModel *model10 = [[DYMenuDataModel alloc]initWithTitle:@"最新更新" imgName:@"sgk_course_sort_new" imgUrl:nil];
    DYMenuDataModel *model11 = [[DYMenuDataModel alloc]initWithTitle:@"最热教程" imgName:@"sgk_course_sort_hot" imgUrl:nil];
    DYMenuDataModel *model12 = [[DYMenuDataModel alloc]initWithTitle:@"评论最多" imgName:@"sgk_course_sort_comment" imgUrl:nil];
    DYMenuDataModel *model13 = [[DYMenuDataModel alloc]initWithTitle:@"收藏最多" imgName:@"sgk_course_sort_collect" imgUrl:nil];
    DYMenuDataModel *model14 = [[DYMenuDataModel alloc]initWithTitle:@"材料包有售" imgName:@"sgk_course_sort_material" imgUrl:nil];
    DYMenuDataModel *model15 = [[DYMenuDataModel alloc]initWithTitle:@"成品有售" imgName:@"sgk_course_sort_product" imgUrl:nil];
    NSArray *sortArr = @[model10, model11, model12, model13, model14, model15];
    
    return @[categorys,timeArr,sortArr];
}

- (void)changeRequestParamDic:(NSInteger)keyIndex value:(NSInteger)valueIndex{
    switch (keyIndex) {
        case 0:{
            if ((valueIndex - 1)<0) {
                [self.requestParamDic removeObjectForKey:@"cate_id"];
                [self.requestParamDic setObject:@"allcate" forKey:@"gcate"];
            }else{
                CourseCategory *category = self.categoryArray[valueIndex - 1];
                [self.requestParamDic setObject:category.cate_id forKey:@"cate_id"];
                [self.requestParamDic setObject:@"cate" forKey:@"gcate"];
            }
            break;
        }
        case 1:{
            [self.requestParamDic setObject:self.pub_timeArr[valueIndex] forKey:@"pub_time"];
            break;
        }
        case 2:{
            [self.requestParamDic setObject:self.orderArr[valueIndex] forKey:@"order"];
            break;
        }
        default:
            break;
    }
}

#pragma mark - getter setter
- (void)setCategoryArray:(NSArray *)categoryArray{
    _categoryArray = categoryArray;
    self.menuDataArr = [SGKPicViewControllerDataModel getMenuDataArray:categoryArray];
}

- (NSArray *)orderArr{
    if (!_orderArr) {
        _orderArr = @[@"new",@"hot",@"comment",@"collect",@"material",@"goods"];
    }
    return _orderArr;
}
- (NSArray *)gcateArr{
    if (!_gcateArr) {
        _gcateArr = @[@"allcate",@"cate"];
    }
    return _gcateArr;
}

- (NSArray *)pub_timeArr{
    if (!_pub_timeArr) {
        _pub_timeArr = @[@"week",@"month",@"all"];
    }
    return _pub_timeArr;
}

- (NSMutableDictionary *)requestParamDic{
    if (!_requestParamDic) {
        _requestParamDic = [NSMutableDictionary dictionary];
        [_requestParamDic setObject:@"allcate" forKey:@"gcate"];
        [_requestParamDic setObject:@"new" forKey:@"order"];
        [_requestParamDic setObject:@"all" forKey:@"pub_time"];
    }
    return _requestParamDic;
}

@end
