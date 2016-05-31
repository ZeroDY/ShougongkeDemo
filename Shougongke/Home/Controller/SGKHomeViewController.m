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
#import "SGKRelationCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SGKHotTopicCell.h"
#import "SGKTalentCell.h"
#import "TalentObject.h"
#import "Slide.h"
#import "TopicObject.h"
#import "DYNetworking+HomeHttpRequest.h"
#import "HomeViewModel.h"
#import "SGKTableViewControllerDataSource.h"
#import "SGKSlideCell.h"
#import "SGKPublishView.h"
#import "SGKSubjectDetailViewController.h"
#import "SGKActivityListViewController.h"
#import "SGKTalentListViewController.h"
#import "SGKRefreshHeader.h"

static NSString *slideCellIdentifier = @"SGKSlideCell";
static NSString *relationCellIdentifier = @"SGKRelationCell";
static NSString *talentCellIdentifier = @"SGKTalentCell.h";
static NSString *hotTopicCellIdentifier = @"SGKHotTopicCell";

@interface SGKHomeViewController ()<UITableViewDelegate,UITableViewDataSource,DYBannerViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SGKHomeTableHeaderView *relationsHeaderView;
@property (nonatomic, strong) SGKHomeTableHeaderView *talentHeaderView;
@property (nonatomic, strong) SGKHomeTableHeaderView *hotTopicHeaderView;
@property (nonatomic, strong) HomeViewModel *homeViewModel;

@end

@implementation SGKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"首页"];
    [self setStatusBarBackgroundColor:mainColor];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.rightItem;
    [self addRefresh];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.hidesBarsOnSwipe = YES;//滑动隐藏 navigation
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.hidesBarsOnSwipe = NO;//关闭滑动隐藏 navigation
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)loadNewData{
    [DYNetworking getHomeViewControllerData:^(HomeViewModel *homeViewModel) {
        self.homeViewModel = homeViewModel;
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)addRefresh{
    self.tableView.mj_header = [SGKRefreshHeader addRefreshHeaderWithRrefreshingBlock:^{
        [self loadNewData];
    }];
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

/**
 *	签到
 */
- (void)signin{
    NSLog(@"签到");
}

#pragma mark - tableView delegate
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0.1f;
    if (section == 1) return 62.0f;
    if (section == 2) return 50.0f;
    return 40.0f;
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
        return [tableView fd_heightForCellWithIdentifier:slideCellIdentifier
                                        cacheByIndexPath:indexPath
                                           configuration:^(SGKSlideCell *cell) {
                                               [cell configCell:self images:self.homeViewModel.bannerImageArray];
                                           }];
    }
    if (section == 1) {
        return [tableView fd_heightForCellWithIdentifier:relationCellIdentifier
                                                  cacheByIndexPath:indexPath
                                                     configuration:^(SGKRelationCell *cell) {
                                                         [cell setRelation:self.homeViewModel.relationArray[indexPath.row]];
                                                     }];
    }
    if (section == 2) {
        return [tableView fd_heightForCellWithIdentifier:talentCellIdentifier
                                        cacheByIndexPath:indexPath
                                           configuration:^(SGKTalentCell *cell) {
                                               [cell setTalent:self.homeViewModel.talent];
                                           }];;
    }
    return [tableView fd_heightForCellWithIdentifier:hotTopicCellIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(SGKHotTopicCell *cell) {
                                           [cell setTopic:self.homeViewModel.topicArray[indexPath.row]];
                                       }];
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [UIView new];
    footView.backgroundColor = tableviewBgColor;
    return footView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *newViewController;
    if (indexPath.section == 1 && indexPath.row == 2) {
        newViewController = [SGKActivityListViewController new];
    }
    else if (indexPath.section == 2) {
        newViewController = [SGKTalentListViewController new];
    }
    else if (indexPath.section == 3) {
        TopicObject *topic = self.homeViewModel.topicArray[indexPath.row];
        SGKSubjectDetailViewController *viewController = [SGKSubjectDetailViewController new];
        viewController.url = topic.mob_h5_url;
        newViewController = viewController;
    }else{
        newViewController = [TestViewController new];
    }
    newViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newViewController animated:YES];
}

#pragma mark - tableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return self.homeViewModel.relationArray.count;
    }
    if (section == 2) {
        if (self.homeViewModel) {
            return 1;
        }
        return 0;
    }
    return self.homeViewModel.topicArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        SGKSlideCell *cell = [tableView dequeueReusableCellWithIdentifier:slideCellIdentifier];
        [cell configCell:self images:self.homeViewModel.bannerImageArray];
        return cell;
    }
    if (section == 1) {
        SGKRelationCell *cell = [tableView dequeueReusableCellWithIdentifier:relationCellIdentifier];
        [cell setRelation:self.homeViewModel.relationArray[indexPath.row]];
        return cell;
    }
    if (section == 2) {
        SGKTalentCell *cell = [tableView dequeueReusableCellWithIdentifier:talentCellIdentifier];
        [cell setTalent:self.homeViewModel.talent];
        return cell;
    }
    SGKHotTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:hotTopicCellIdentifier];
    [cell setTopic:self.homeViewModel.topicArray[row]];
    return cell;
}

#pragma mark -- DYBanner delegate
- (void)bannerImageView:(UIImageView *)imageView loadImage:(NSString *)nameOrUrl{
    [imageView sd_setImageWithURL:[NSURL URLWithString:nameOrUrl] placeholderImage:[UIImage imageNamed:@"slide_bg"]];
}

- (void)bannerView:(DYBannerView *)bannerView didSelectAtIndex:(NSUInteger)index{
    NSLog(@"--%@",self.homeViewModel.bannerImageArray[index]);
}

- (void)showleft{
    [SGKPublishView showPublishViewAddedTo:self];
}

- (void)showright{
    NSLog(@"right");
}

#pragma mark - getter and setter
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
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[SGKSlideCell class] forCellReuseIdentifier:slideCellIdentifier];
        [_tableView registerClass:[SGKRelationCell class] forCellReuseIdentifier:relationCellIdentifier];
        [_tableView registerClass:[SGKTalentCell class] forCellReuseIdentifier:talentCellIdentifier];
        [_tableView registerClass:[SGKHotTopicCell class] forCellReuseIdentifier:hotTopicCellIdentifier];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setTableFooterView:[UIView new]];
        [_tableView setSeparatorColor:[UIColor clearColor]];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (SGKHomeTableHeaderView *)relationsHeaderView{
    if (!_relationsHeaderView) {
        _relationsHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _relationsHeaderView.titleLabel.text = @"大家都在看";
        [_relationsHeaderView.signinButton addTarget:self action:@selector(signin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _relationsHeaderView;
}

- (SGKHomeTableHeaderView *)talentHeaderView{
    if (!_talentHeaderView) {
        _talentHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _talentHeaderView.titleLabel.text = @"达人推荐";
        _talentHeaderView.signinButton.hidden = YES;
    }
    return _talentHeaderView;
}

- (SGKHomeTableHeaderView *)hotTopicHeaderView{
    if (!_hotTopicHeaderView) {
        _hotTopicHeaderView = [[SGKHomeTableHeaderView alloc]init];
        _hotTopicHeaderView.titleLabel.text = @"热门专题";
        _hotTopicHeaderView.signinButton.hidden = YES;
    }
    return _hotTopicHeaderView;
}

@end
