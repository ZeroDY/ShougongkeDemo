//
//  UserViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKUserViewController.h"
#import "SGKUserTableViewFirstCell.h"

static NSString *cellReuseIdentifier = @"SGKUserTableViewFirstCell";

@interface SGKUserViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArr;

@end

@implementation SGKUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1)  return 6;
    if (section == 2)  return 5;
    if (section == 3)  return 11;
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"userCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (section == 0) {
        NSString *str = @"点击这里登录";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
        [attrStr addAttribute:NSForegroundColorAttributeName
                        value:[UIColor redColor]
                        range:NSMakeRange(4, 2)];
        cell.imageView.image = [UIImage imageNamed:@"sgk_avater_normal"];
        cell.textLabel.attributedText = attrStr;
        return cell;
    }
    if (row == 0) {
        SGKUserTableViewFirstCell *firstCell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
        firstCell.name_lab.text = self.dataArr[section][row];
        return firstCell;
    }
    cell.textLabel.text = self.dataArr[section][row];
    return cell;
}

#pragma mark - getter and setter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = tableviewBgColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setTableFooterView:[[UIView alloc]init]];
        [_tableView registerClass:[SGKUserTableViewFirstCell class] forCellReuseIdentifier:cellReuseIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        NSArray *arr1 = @[@"消息通知",@"评论",@"回复",@"@我",@"私信",@"手工圈"];
        NSArray *arr2 = @[@"订单",@"市集订单",@"教程订单",@"线下课订单",@"我的优惠券"];
        NSArray *arr3 = @[@"个人设置",@"个人资料",@"等级与积分",@"修改密码",@"清除缓存",@"帮助中心",@"新消息通知",@"意见与反馈",@"关于手工客",@"关注手工客微信",@"喜欢手工客(在AppStore评论手工客)"];
        _dataArr = @[[NSArray new],arr1,arr2,arr3];
    }
    return  _dataArr;
}


@end
