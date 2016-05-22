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
#import "HomeViewModel.h"
#import "Relation.h"

@implementation DYNetworking (HomeHttpRequest)

+ (void)getHomeViewControllerData:(void (^)(HomeViewModel *))homeViewModelBlock
                             fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:@"/index.php?c=index&a=indexnew&vid=16"
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             
                             HomeViewModel *homeModel = [HomeViewModel new];
                             NSDictionary *dataDic = resultDic[@"data"];
                             // Slide  banner
                             NSArray *slideArr = [Slide mj_objectArrayWithKeyValuesArray:dataDic[@"slide"]];
                             NSMutableArray *bannerImages = [NSMutableArray array];
                             for (Slide *slide in slideArr) {
                                 [bannerImages addObject:slide.host_pic];
                             }
                             // Talent
                             TalentObject *talent = [TalentObject mj_objectWithKeyValues:dataDic[@"daren"]];
                             // relation
                             NSDictionary *relationDic = dataDic[@"relations"];
                             Relation *relation0 =
                             [[Relation alloc] initWithSubject:relationDic[@"salon"][@"subject"]
                                                         title:relationDic[@"salon"][@"title"]
                                                       pic_url:relationDic[@"salon"][@"pic"]];
                             Relation *relation1 =
                             [[Relation alloc]initWithSubject:@"好友动态"
                                                        title:relationDic[@"dynamic"][@"title"]
                                                      pic_url:relationDic[@"dynamic"][@"pic"] ];
                             Relation *relation2 =
                             [[Relation alloc]initWithSubject:@"最新活动"
                                                        title:relationDic[@"competition"][@"c_name"]
                                                      pic_url:relationDic[@"competition"][@"pic"]];
                             NSArray *relationArr = @[relation0,relation1,relation2];
                             // hottopic
                             NSArray *topicArr = [TopicObject mj_objectArrayWithKeyValuesArray:dataDic[@"hotTopic"]];
                             
                             homeModel.slideArray = slideArr;
                             homeModel.bannerImageArray = bannerImages;
                             homeModel.relationArray = relationArr;
                             homeModel.talent = talent;
                             homeModel.topicArray = topicArr;

                             homeViewModelBlock(homeModel);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
}

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
