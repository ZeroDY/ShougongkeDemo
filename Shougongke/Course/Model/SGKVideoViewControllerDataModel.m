//
//  SGKVideoViewControllerDataModel.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKVideoViewControllerDataModel.h"
#import "DYMenuDataModel.h"
#import "CourseCategory.h"

@implementation SGKVideoViewControllerDataModel

+ (NSArray *)getMenuDataArray:(NSArray *)categoryArr{
    DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:@"全部分类" imgName:@"sgk_course_cate_all" imgUrl:nil];
    NSMutableArray *categorys = [NSMutableArray arrayWithObjects:model, nil];
    for (CourseCategory *category in categoryArr) {
        DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:category.cate_name imgName:nil imgUrl:category.cate_ico];
        [categorys addObject:model];
    }
    
    DYMenuDataModel *model0 = [[DYMenuDataModel alloc]initWithTitle:@"全部视频" imgName:@"sgk_class_home_nav_class_all_type" imgUrl:nil];
    DYMenuDataModel *model1 = [[DYMenuDataModel alloc]initWithTitle:@"免费" imgName:@"sgk_class_home_nav_sort_price_free" imgUrl:nil];
    DYMenuDataModel *model2 = [[DYMenuDataModel alloc]initWithTitle:@"付费" imgName:@"sgk_class_home_nav_sort_price_free" imgUrl:nil];
    NSArray *timeArr = @[model0, model1, model2];
    
    DYMenuDataModel *model11 = [[DYMenuDataModel alloc]initWithTitle:@"最新更新" imgName:@"sgk_course_sort_new" imgUrl:nil];
    DYMenuDataModel *model12 = [[DYMenuDataModel alloc]initWithTitle:@"人气" imgName:@"sgk_class_home_nav_sort_view" imgUrl:nil];
    DYMenuDataModel *model13 = [[DYMenuDataModel alloc]initWithTitle:@"好评度" imgName:@"sgk_class_home_nav_sort_credit" imgUrl:nil];
    
    DYMenuDataModel *model14 = [[DYMenuDataModel alloc]initWithTitle:@"收藏最多" imgName:@"sgk_course_sort_collect" imgUrl:nil];
    DYMenuDataModel *model15 = [[DYMenuDataModel alloc]initWithTitle:@"材料包有售" imgName:@"sgk_course_sort_material" imgUrl:nil];
    DYMenuDataModel *model16 = [[DYMenuDataModel alloc]initWithTitle:@"价格低到高" imgName:@"sgk_class_home_nav_sort_price_down" imgUrl:nil];
    DYMenuDataModel *model17 = [[DYMenuDataModel alloc]initWithTitle:@"价格高到低" imgName:@"sgk_class_home_nav_sort_price_up" imgUrl:nil];
    NSArray *sortArr = @[ model11, model12, model13, model14, model15, model16, model17];
    
    return @[categorys,timeArr,sortArr];
}

- (void)changeRequestParamDic:(NSInteger)keyIndex value:(NSInteger)valueIndex{
    switch (keyIndex) {
        case 0:{
            if (valueIndex == 0) {
                [self.requestParamDic setObject:@"0" forKey:@"cate"];
            }else{
                CourseCategory *category = self.categoryArray[valueIndex - 1];
                [self.requestParamDic setObject:category.cate_id forKey:@"cate"];
            }
            break;
        }
        case 1:{
            [self.requestParamDic setObject:self.priceArr[valueIndex] forKey:@"price"];
            break;
        }
        case 2:{
            [self.requestParamDic setObject:self.sortArr[valueIndex] forKey:@"sort"];
            break;
        }
        default:
            break;
    }
}

#pragma mark - getter setter
- (void)setCategoryArray:(NSArray *)categoryArray{
    _categoryArray = categoryArray;
    self.menuDataArr = [SGKVideoViewControllerDataModel getMenuDataArray:categoryArray];
}

- (NSArray *)priceArr{
    if (!_priceArr) {
        _priceArr = @[@"0",@"1",@"2"];
    }
    return _priceArr;
}
- (NSArray *)sortArr{
    if (!_sortArr) {
        _sortArr = @[@"1",@"2",@"7",@"3",@"4",@"6",@"5"];
    }
    return _sortArr;
}

- (NSMutableDictionary *)requestParamDic{
    if (!_requestParamDic) {
        _requestParamDic = [NSMutableDictionary dictionary];
        [_requestParamDic setObject:@"0" forKey:@"cate"];
        [_requestParamDic setObject:@"0" forKey:@"price"];
        [_requestParamDic setObject:@"1" forKey:@"sort"];
        [_requestParamDic setObject:@"1" forKey:@"page"];
    }
    return _requestParamDic;
}

@end
