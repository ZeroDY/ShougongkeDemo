//
//  DYTableViewControllerDataSource.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/21.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYTableViewControllerDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, copy) NSString *cellIdentifier;

@end
