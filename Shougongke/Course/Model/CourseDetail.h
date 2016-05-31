//
//  CourseDetail.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CourseDetailGcates,CourseDetailMaterial,CourseDetailOpus,CourseDetailComment,CourseMaybeLike,CourseDetailStep,CourseDetailTools;
@interface CourseDetail : NSObject


@property (nonatomic, copy) NSString *price_material;

@property (nonatomic, copy) NSString *face_pic;

@property (nonatomic, copy) NSString *comment_num;

@property (nonatomic, copy) NSString *collect;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *difficulty;

@property (nonatomic, copy) NSString *host_pic_s;

@property (nonatomic, copy) NSString *is_collect;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *cate_pic;

@property (nonatomic, strong) NSArray<CourseDetailStep *> *step;

@property (nonatomic, strong) NSArray<CourseMaybeLike *> *maybe_like;

@property (nonatomic, strong) NSArray<CourseDetailComment *> *comment_list;

@property (nonatomic, strong) NSArray<CourseDetailMaterial *> *material;

@property (nonatomic, strong) NSArray<CourseDetailOpus *> *opus;

@property (nonatomic, strong) NSArray<CourseDetailTools *> *tools;

@property (nonatomic, strong) NSArray<NSNumber *> *ogcate;

@property (nonatomic, strong) CourseDetailGcates *gcates;

@property (nonatomic, copy) NSString *gcate;

@property (nonatomic, copy) NSString *subject;

@property (nonatomic, copy) NSString *laud;

@property (nonatomic, copy) NSString *is_sale_pro;

@property (nonatomic, copy) NSString *hand_id;

@property (nonatomic, copy) NSString *opus_num;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *host_pic;

@property (nonatomic, copy) NSString *cate_name;

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, copy) NSString *add_time;

@property (nonatomic, copy) NSString *made_time;

@property (nonatomic, copy) NSString *price_pro;

@property (nonatomic, copy) NSString *is_cache;

@property (nonatomic, copy) NSString *host_pic_m;

@property (nonatomic, copy) NSString *host_pic_ss;

@property (nonatomic, copy) NSString *is_laud;

@property (nonatomic, copy) NSString *is_guan;

@property (nonatomic, copy) NSString *is_sale_material;

@property (nonatomic, copy) NSString *host_pic_ms;

@property (nonatomic, copy) NSString *collect_o;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *hand_daren;

@property (nonatomic, copy) NSString *tb_url;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic, copy) NSString *view_o;


@end
@interface CourseDetailGcates : NSObject

@property (nonatomic, copy) NSString *cate_oneid;

@property (nonatomic, copy) NSString *cate_onename;

@end

@interface CourseDetailMaterial : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *num;

@end

@interface CourseDetailOpus : NSObject

@property (nonatomic, copy) NSString *opus_id;

@property (nonatomic, copy) NSString *circle_id;

@property (nonatomic, copy) NSString *host_pic;

@end

@interface CourseDetailComment : NSObject

@property (nonatomic, copy) NSString *hand_id;

@property (nonatomic, copy) NSString *comment_id;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *lasttime;

@property (nonatomic, copy) NSString *touid;

@property (nonatomic, copy) NSString *touname;

@property (nonatomic, copy) NSString *hand_daren;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *add_time;

@end

@interface CourseMaybeLike : NSObject

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, copy) NSString *num_iid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *yh_price;

@property (nonatomic, copy) NSString *shop_type;

@property (nonatomic, copy) NSString *open_iid;

@property (nonatomic, copy) NSString *cate;

@property (nonatomic, copy) NSString *num;

@property (nonatomic, copy) NSString *sum;

@end

@interface CourseDetailStep : NSObject

@property (nonatomic, copy) NSString *w;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *pic_s;

@property (nonatomic, copy) NSString *h;

@property (nonatomic, copy) NSString *url;

@end

@interface CourseDetailTools : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *num;

@end

