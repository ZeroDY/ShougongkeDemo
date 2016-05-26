//
//  DYMenuItem.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYMenuItem.h"


@implementation DYMenuItem

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect selfFrame = self.frame;
    CGRect imageFame = self.imageView.frame;
    imageFame.origin.x = selfFrame.size.width-imageFame.size.width-8;
    self.imageView.frame = imageFame;
    CGPoint titleCenter = CGPointMake(imageFame.origin.x/2, self.titleLabel.center.y);
    self.titleLabel.center = titleCenter;
}
@end
