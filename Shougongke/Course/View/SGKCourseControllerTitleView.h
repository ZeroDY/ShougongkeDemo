//
//  SGKCourseControllerTitleView.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TitleClickBlock)(UIButton *button);

@interface SGKCourseControllerTitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame block:(TitleClickBlock)block;
-(void)updateSelecterToolsIndex:(NSInteger )index;


@end
