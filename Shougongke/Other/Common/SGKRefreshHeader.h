//
//  SGKRefreshHeader.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface SGKRefreshHeader : MJRefreshGifHeader

+ (instancetype)addRefreshHeaderWithRrefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
@end
