//
//  DYNetworking+HomeHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+HomeHttpRequest.h"
#import "Slide.h"
#import "TalentObject.h"
#import "TopicObject.h"

@implementation DYNetworking (HomeHttpRequest)

+ (void)getHomeVCData:(void (^)(NSArray *))slideArrBlock
               talent:(void (^)(TalentObject *))talentBlock
             topicArr:(void (^)(NSArray *))topicArrBlock{
    [DYNetworking getWithUrl:@"/index.php?c=index&a=indexnew&vid=16"
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSDictionary *dataDic = resultDic[@"data"];
                             NSArray *slideArr = [Slide mj_objectArrayWithKeyValuesArray:dataDic[@"slide"]];
                             TalentObject *talent = [TalentObject mj_objectWithKeyValues:dataDic[@"daren"]];
                             NSArray *topicArr = [TopicObject mj_objectArrayWithKeyValuesArray:dataDic[@"hotTopic"]];
                             slideArrBlock(slideArr);
                             talentBlock(talent);
                             topicArrBlock(topicArr);
                         }
                } fail:^(NSError *error) {
                    NSLog(@"------error-----%@",error);
                }];
    return;
}

@end
