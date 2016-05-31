//
//  SGKActivityIntroduceViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/29.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKActivityIntroduceViewController.h"
#import "SGKActivityDetailViewController.h"

@interface SGKActivityIntroduceViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SGKActivityIntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.shougongke.com/index.php?c=Competition&cid=%@",self.cid]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:self.webView].y;
    if (panTranslationY > 0) { //下滑趋势，显示
        self.block(JionButtonLayoutUp);
    }
    else if(panTranslationY < 0) {  //上滑趋势，隐藏
        self.block(JionButtonLayoutDown);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)webView{
    if(!_webView){
        _webView = [UIWebView new];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
        _webView.scrollView.delegate = self;
    }
    return _webView;
}


@end
