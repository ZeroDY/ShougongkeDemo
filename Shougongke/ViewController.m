//
//  ViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/16.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "ViewController.h"
#import "SystemsDetection.h"
#import "DYBannerView.h"
#import "Masonry.h"

@interface ViewController ()<DYBannerViewDelegate>

@property (nonatomic, strong)DYBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *platform = [SystemsDetection getDeviceVersCoding];
    NSLog(@"------  %@",platform);
    NSArray *array = @[
                       [NSString stringWithFormat:@"newfeature_01_%@",platform],
                       [NSString stringWithFormat:@"newfeature_02_%@",platform],
                       [NSString stringWithFormat:@"newfeature_03_%@",platform],
                       [NSString stringWithFormat:@"newfeature_04_%@",platform],
                       [NSString stringWithFormat:@"newfeature_05_%@",platform]
                       ];
    
    
    self.bannerView = [[DYBannerView alloc] init];
    self.bannerView.currentPageIndicatorTintColor = [UIColor colorWithRed:0.902 green:0.239 blue:0.231 alpha:1.000];
    self.bannerView.pageIndicatorTintColor = [UIColor whiteColor];
    self.bannerView.cycleEnabled = NO;
    [self.bannerView configBannerWithDelegate:self
                                       images:array];
    
    [self.view addSubview:self.bannerView];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

- (void)bannerImageView:(UIImageView *)imageView loadImage:(NSString *)nameOrUrl{
    imageView.image = [UIImage imageNamed:nameOrUrl];
}

- (void)bannerView:(DYBannerView *)bannerView didSelectAtIndex:(NSUInteger)index{
    if (bannerView == self.bannerView) {
        NSLog(@"选中-- bannerView1 - %@",@(index));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
