//
//  SGKPublishView.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKPublishView.h"
#import "SGKLoginViewController.h"

@interface SGKPublishView ()

@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) UIButton *courseBtn;
@property (nonatomic, strong) UIButton *handcirleBtn;
@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation SGKPublishView

+ (instancetype)showPublishViewAddedTo:(UIViewController *)viewController{
    SGKPublishView *publishView = [[self alloc] initWithView:viewController];
    [viewController.view.window addSubview:publishView];
    return publishView;
}

+ (BOOL)hidePublishViewForView:(UIView *)view{
    SGKPublishView *publishView = [self publishViewForView:view];
    if (publishView != nil) {
        [publishView removeFromSuperview];
        return YES;
    }
    return NO;
}

+ (SGKPublishView *)publishViewForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (SGKPublishView *)subview;
        }
    }
    return nil;
}

- (instancetype)initWithView:(UIViewController *)viewController {
    CGRect frame = CGRectMake(viewController.view.bounds.origin.x, viewController.view.bounds.origin.y, SCREENWIDTH, SCREENHEIGHT);
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.containView];
        [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
        self.viewController = viewController;
        [self.containView addSubview:self.courseBtn];
        [self.containView addSubview:self.handcirleBtn];
        [self addTarget:self action:@selector(hideSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)hideSelf{
    [SGKPublishView hidePublishViewForView:self.viewController.view.window];
}

- (void)publishCourse{
    [SGKPublishView hidePublishViewForView:self.viewController.view.window];
//    SGKLoginViewController *publish = [SGKLoginViewController new];
//    [self.viewController presentViewController:publish animated:YES completion:^{
//        NSLog(@"发教程");
//    }];
}

- (void)publishHandCircle{
    [SGKPublishView hidePublishViewForView:self.viewController.view.window];
//    SGKLoginViewController *publish = [SGKLoginViewController new];
//    [self.viewController presentViewController:publish animated:YES completion:^{
//        NSLog(@"发手工圈");
//    }];
}

- (UIView *)containView{
    if (!_containView) {
        _containView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENWIDTH*0.32)];
        _containView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    }
    return _containView;
}

- (UIButton *)courseBtn{
    if (!_courseBtn) {
        _courseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/2, SCREENWIDTH*0.32)];
        [_courseBtn setTitle:@"发教程" forState: UIControlStateNormal];
        [_courseBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_courseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_courseBtn setImage:[UIImage imageNamed:@"sgk_publish_course"] forState:UIControlStateNormal];
        CGFloat w = (_courseBtn.imageView.frame.size.width + _courseBtn.titleLabel.frame.size.width)/2;
        _courseBtn.imageEdgeInsets = UIEdgeInsetsMake(-_courseBtn.imageView.frame.size.height, w, 0, 0);
        _courseBtn.titleEdgeInsets = UIEdgeInsetsMake(_courseBtn.imageView.frame.size.height, -w, 0, 0);
        [_courseBtn addTarget:self action:@selector(publishCourse) forControlEvents:UIControlEventTouchUpInside];
    }
    return _courseBtn;
}

- (UIButton *)handcirleBtn{
    if (!_handcirleBtn) {
        _handcirleBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH/2, 0, SCREENWIDTH/2, SCREENWIDTH*0.32)];
        [_handcirleBtn setTitle:@"发手工圈" forState: UIControlStateNormal];
        [_handcirleBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_handcirleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_handcirleBtn setImage:[UIImage imageNamed:@"sgk_publish_sgq"] forState:UIControlStateNormal];
        CGFloat w = (_handcirleBtn.imageView.frame.size.width + _handcirleBtn.titleLabel.frame.size.width)/2;
        _handcirleBtn.imageEdgeInsets = UIEdgeInsetsMake(-_handcirleBtn.imageView.frame.size.height, w, 0, 0);
        _handcirleBtn.titleEdgeInsets = UIEdgeInsetsMake(_handcirleBtn.imageView.frame.size.height, -w+20, 0, 0);
        [_handcirleBtn addTarget:self action:@selector(publishHandCircle) forControlEvents:UIControlEventTouchUpInside];
    }
    return _handcirleBtn;
}



@end
