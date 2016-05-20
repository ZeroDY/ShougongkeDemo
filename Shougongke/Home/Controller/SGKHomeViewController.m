//
//  HomeViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKHomeViewController.h"
#import "TestViewController.h"
#import "DYBannerView.h"
#import "SGKHomeTableHeaderView.h"

@interface SGKHomeViewController ()<UITableViewDelegate,UITableViewDataSource,DYBannerViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DYBannerView *bannerView;
@property (nonatomic, strong) NSArray *bannerImageArray;
@property (nonatomic, strong) SGKHomeTableHeaderView *relationsHeaderView;
@property (nonatomic, strong) SGKHomeTableHeaderView *talentHeaderView;
@property (nonatomic, strong) SGKHomeTableHeaderView *hotTopicHeaderView;

@end

@implementation SGKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"首页"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.rightItem;

    [self setStatusBarBackgroundColor:mainColor];
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
/**
 *	签到
 */
- (void)signin{
    NSLog(@"签到");
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 3;
    }
    if (section == 2) {
        return 2;
    }
    return 20;
    
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1f;
    }
    if (section == 1) {
        return 62.0f;
    }
    return 50.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 135;
    }
    if (section == 1) {
        return 70;
    }
    if (section == 2) {
        return 220;
    }
    return 210;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return self.relationsHeaderView;
    }
    if (section == 2) {
        return self.talentHeaderView;
    }
    if (section == 3) {
        return self.hotTopicHeaderView;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [UIView new];
    footView.backgroundColor = RGB(247, 239, 239);
    return footView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        static NSString *bannerIdentifier = @"HomeTableViewSection0";
        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:bannerIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bannerIdentifier];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            [cell addSubview:self.bannerView];
            [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(cell.mas_top);
                make.left.mas_equalTo(cell.mas_left);
                make.right.mas_equalTo(cell.mas_right);
                make.bottom.mas_equalTo(cell.mas_bottom);
            }];
        }
        
        return cell;
    }
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
//        NSBundle *bundle = [NSBundle mainBundle];
//        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:nil options:nil];
//        cell = (<#UITableViewCell#> *)[nibArray objectAtIndex:0];
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}
#pragma mark -- DYBanner delegate

- (void)bannerImageView:(UIImageView *)imageView loadImage:(NSString *)nameOrUrl{
    [imageView sd_setImageWithURL:[NSURL URLWithString:nameOrUrl] placeholderImage:[UIImage imageNamed:@"chatBgImg"]];
}

- (void)bannerView:(DYBannerView *)bannerView didSelectAtIndex:(NSUInteger)index{
    NSLog(@"--%@",self.bannerImageArray[index]);
}


#pragma mark -- scroll delegate

//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y + _tableView.contentInset.top;//注意
    CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:self.tableView].y;
    if (offsetY > 80) {
        if (panTranslationY > 50) { //下滑趋势，显示
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }
        else if(panTranslationY < -50) {  //上滑趋势，隐藏
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
    }
    else if(offsetY < 20 ) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)showleft{
    NSLog(@"left");
}

- (void)showright{
    NSLog(@"right");
}


#pragma mark - getter and setter

- (NSArray *)bannerImageArray{
    if (!_bannerImageArray) {
        _bannerImageArray = @[
                              @"http://img4.shougongke.com/Public/data/version/201605/146370796233878.jpg",
                              @"http://img4.shougongke.com/Public/data/version/201605/146370861045370.jpg",
                              @"http://img4.shougongke.com/Public/data/version/201605/146370831829925.jpg",
                              @"http://img4.shougongke.com/Public/data/version/201605/146370880290143.jpg",
                              @"http://img4.shougongke.com/Public/data/version/201605/146310518970413.jpg"
                              ];
    }
    return _bannerImageArray;
}

- (DYBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[DYBannerView alloc]init];
        _bannerView.currentPageIndicatorTintColor = mainColor;
        _bannerView.pageIndicatorTintColor = [UIColor whiteColor];
        [_bannerView configBannerWithDelegate:self
                                           images:self.bannerImageArray];
    }
    return _bannerView;
}

- (UIBarButtonItem *)leftItem{
    if (!_leftItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 25, 25);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_bt_userhome_publish2"] forState:UIControlStateNormal];
        [publisButton addTarget:self action:@selector(showleft) forControlEvents:UIControlEventTouchUpInside];
        _leftItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _leftItem;
}

- (UIBarButtonItem *)rightItem{
    if (!_rightItem) {
        UIButton *publisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publisButton.frame = CGRectMake(0, 0, 20, 20);
        [publisButton setBackgroundImage:[UIImage imageNamed:@"sgk_common_search_normal"] forState:UIControlStateNormal];
        [publisButton addTarget:self action:@selector(showright) forControlEvents:UIControlEventTouchUpInside];
        _rightItem = [[UIBarButtonItem alloc] initWithCustomView:publisButton];
    }
    return _rightItem;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setTableFooterView:[UIView new]];
        [_tableView setSeparatorColor:[UIColor clearColor]];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
    }
    return _tableView;
}

- (SGKHomeTableHeaderView *)relationsHeaderView{
    if (!_relationsHeaderView) {
        _relationsHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _headerView1.titleLabel.text = @"大家都在看";
        [_relationsHeaderView.signinButton addTarget:self action:@selector(signin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _relationsHeaderView;
}

- (SGKHomeTableHeaderView *)talentHeaderView{
    if (!_talentHeaderView) {
        _talentHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _headerView2.titleLabel.text = @"达人推荐";
        _headerView2.signinButton.hidden = YES;
    }
    return _talentHeaderView;
}

- (SGKHomeTableHeaderView *)hotTopicHeaderView{
    if (!_hotTopicHeaderView) {
        _hotTopicHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _headerView3.titleLabel.text = @"热门专题";
        _headerView3.signinButton.hidden = YES;
    }
    return _hotTopicHeaderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
