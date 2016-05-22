//
//  Relation.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Relation : NSObject


@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pic_url;

- (id)initWithSubject:(NSString *)subject
                title:(NSString *)title
           pic_url:(NSString *)pic_url;

@end
