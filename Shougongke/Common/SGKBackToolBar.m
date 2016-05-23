//
//  SGKBackBarItem.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKBackToolBar.h"

@interface SGKBackToolBar ()

@property (nonatomic, strong) UIBarButtonItem *backItem;
@property (nonatomic, copy) BackCliclBlock backCliclBlock;

@end

@implementation SGKBackToolBar

- (instancetype)initWithClick:(BackCliclBlock)click{
    self = [super init];
    if (self) {
        self.backCliclBlock = click;
        self.barStyle = UIBarStyleDefault;
        self.items = @[self.backItem];
        self.tintColor = mainColor;
//        self.translucent = YES;
        self.barTintColor = [UIColor colorWithWhite:1 alpha:0.6];
    }
    return self;
}

- (void)backclick{
    self.backCliclBlock();
}

- (UIBarButtonItem *)backItem{
    if(!_backItem){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setImage:[UIImage imageNamed:@"sgk_back_arrow2"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
        _backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _backItem;
}


@end
