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
#import "SGKMainViewController.h"

@interface ViewController ()<DYBannerViewDelegate>

@property (nonatomic, strong)DYBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *platform = [SystemsDetection getDeviceVersCoding];
    NSArray *array = @[
                       [NSString stringWithFormat:@"newfeature_01_%@",platform],
                       [NSString stringWithFormat:@"newfeature_02_%@",platform],
                       [NSString stringWithFormat:@"newfeature_03_%@",platform],
                       [NSString stringWithFormat:@"newfeature_04_%@",platform],
                       [NSString stringWithFormat:@"newfeature_05_%@",platform]
                       ];
    
    
    self.bannerView = [[DYBannerView alloc] init];
    self.bannerView.currentPageIndicatorTintColor = mainColor;
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

- (void)viewDidAppear:(BOOL)animated{
    SGKMainViewController *mainVC = [[SGKMainViewController alloc]init];
    [self presentViewController:mainVC animated:YES completion:^{
        
    }];
}

- (void)bannerImageView:(UIImageView *)imageView loadImage:(NSString *)nameOrUrl{
    imageView.image = [UIImage imageNamed:nameOrUrl];
}

- (void)bannerView:(DYBannerView *)bannerView didSelectAtIndex:(NSUInteger)index{
    if (bannerView == self.bannerView) {
        NSLog(@"选中-- bannerView1 - %@",@(index));
//        if (index == 4) {
            SGKMainViewController *mainVC = [[SGKMainViewController alloc]init];
            [self presentViewController:mainVC animated:YES completion:^{
                
            }];
//        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
