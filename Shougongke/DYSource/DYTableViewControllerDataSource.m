//
//  DYTableViewControllerDataSource.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/21.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYTableViewControllerDataSource.h"

@implementation DYTableViewControllerDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"forIndexPath:indexPath];
    return cell;

}


@end
