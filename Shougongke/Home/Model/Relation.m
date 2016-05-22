//
//  Relation.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "Relation.h"

@implementation Relation

- (id)initWithSubject:(NSString *)subject
                title:(NSString *)title
              pic_url:(NSString *)pic_url{
    self = [super init];
    if (self) {
        _subject = subject;
        _title = title;
        _pic_url = pic_url;
    }
    return self;
}


@end
