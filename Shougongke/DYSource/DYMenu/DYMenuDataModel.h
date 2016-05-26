//
//  DYMenuDataModel.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYMenuDataModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *imgUrl;

- (instancetype)initWithTitle:(NSString *)title
                      imgName:(NSString *)name
                       imgUrl:(NSString *)url;

@end
