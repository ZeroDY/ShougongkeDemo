//
//  SGKVideoViewControllerDataModel.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGKVideoViewControllerDataModel : NSObject

@property (nonatomic, copy) NSArray *videoArray;

@property (nonatomic, copy) NSArray *sortArr;
@property (nonatomic, copy) NSArray *priceArr;

@property (nonatomic, copy) NSArray *categoryArray;
@property (nonatomic, copy) NSArray *menuDataArr;

@property (nonatomic, strong) NSMutableDictionary *requestParamDic;

- (void)changeRequestParamDic:(NSInteger)keyIndex value:(NSInteger)valueIndex;

+ (NSArray *)getMenuDataArray:(NSArray *)categoryArr;

@end
