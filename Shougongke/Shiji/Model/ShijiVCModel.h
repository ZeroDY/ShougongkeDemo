//
//  ShijiVCModel.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShijiTopic,ShijiHot,ShijiBest;

@interface ShijiVCModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> *topicBest;

@property (nonatomic, strong) NSArray<ShijiTopic *> *topic;

@property (nonatomic, strong) NSArray<ShijiHot *> *hot;

@property (nonatomic, strong) NSArray<ShijiBest *> *best;

@end



@interface ShijiTopic : NSObject

@property (nonatomic, copy) NSString *topic_name;

@property (nonatomic, copy) NSString *mob_h5_url;

@property (nonatomic, copy) NSString *host_pic;

@property (nonatomic, copy) NSString *last_id;

//@property (nonatomic, copy) NSString *template;

@property (nonatomic, copy) NSString *topic_id;

@end


@interface ShijiHot : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *hot_type;

@property (nonatomic, copy) NSString *pic;

@end



@interface ShijiBest : NSObject

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, copy) NSString *num_iid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *yh_price;

@property (nonatomic, copy) NSString *shop_type;

@property (nonatomic, copy) NSString *open_iid;

@property (nonatomic, copy) NSString *sum;

@end

