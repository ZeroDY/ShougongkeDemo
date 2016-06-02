//
//  HomeViewModel.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Talent.h"
#import "Slide.h"
#import "HomeTopic.h"
#import "Relation.h"

@interface HomeViewModel : NSObject

@property (nonatomic, copy) NSArray<Slide *> *slideArray;
@property (nonatomic, copy) NSArray<NSString *> *bannerImageArray;
@property (nonatomic, copy) NSArray<Relation *> *relationArray;
@property (nonatomic, strong) Talent *talent;
@property (nonatomic, copy) NSArray<HomeTopic *> *topicArray;

@end
