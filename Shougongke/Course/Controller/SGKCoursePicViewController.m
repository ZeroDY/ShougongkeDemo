//
//  SGKCoursePicViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKCoursePicViewController.h"
#import "DYMenuView.h"
#import "DYMenuCollectionViewCell.h"
#import "CourseCategory.h"

@interface SGKCoursePicViewController ()

@property (nonatomic, strong) NSArray *menuDataArr;
@property (nonatomic, strong) DYMenuView *menuView;

@end

@implementation SGKCoursePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.menuView];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
    }];
}

- (void)creatMenuView{
    if (self.menuDataArr) {
        [self.menuView configureViewWith:self.menuDataArr selectIndex:^(NSInteger itemIndex, NSInteger cellIndex) {
            NSLog(@"----%ld----%ld",itemIndex,cellIndex);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[DYMenuView alloc]init];
    }
    return _menuView;
}

- (void)setCategoryArray:(NSArray *)categoryArray{
    _categoryArray = categoryArray;
    
    DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:@"全部分类" imgName:@"sgk_course_cate_all" imgUrl:nil];
    NSMutableArray *categorys = [NSMutableArray arrayWithObjects:model, nil];
    for (CourseCategory *category in categoryArray) {
        DYMenuDataModel *model = [[DYMenuDataModel alloc]initWithTitle:category.cate_name imgName:nil imgUrl:category.cate_ico];
        [categorys addObject:model];
    }

    DYMenuDataModel *model0 = [[DYMenuDataModel alloc]initWithTitle:@"一周" imgName:@"sgk_course_time_week" imgUrl:nil];
    DYMenuDataModel *model1 = [[DYMenuDataModel alloc]initWithTitle:@"一月" imgName:@"sgk_course_time_month" imgUrl:nil];
    DYMenuDataModel *model2 = [[DYMenuDataModel alloc]initWithTitle:@"全部教程" imgName:@"sgk_course_time_all" imgUrl:nil];
    NSArray *timeArr = @[model0, model1, model2];
    
    DYMenuDataModel *model10 = [[DYMenuDataModel alloc]initWithTitle:@"最热教程" imgName:@"sgk_course_sort_hot" imgUrl:nil];
    DYMenuDataModel *model11 = [[DYMenuDataModel alloc]initWithTitle:@"最新更新" imgName:@"sgk_course_sort_new" imgUrl:nil];
    DYMenuDataModel *model12 = [[DYMenuDataModel alloc]initWithTitle:@"评论最多" imgName:@"sgk_course_sort_comment" imgUrl:nil];
    DYMenuDataModel *model13 = [[DYMenuDataModel alloc]initWithTitle:@"收藏最多" imgName:@"sgk_course_sort_collect" imgUrl:nil];
    DYMenuDataModel *model14 = [[DYMenuDataModel alloc]initWithTitle:@"材料包有售" imgName:@"sgk_course_sort_material" imgUrl:nil];
    DYMenuDataModel *model15 = [[DYMenuDataModel alloc]initWithTitle:@"成品有售" imgName:@"sgk_course_sort_product" imgUrl:nil];
    NSArray *sortArr = @[model10, model11, model12, model13, model14, model15];

    self.menuDataArr = @[categorys,timeArr,sortArr];
//    self.menuView.selectedColor = mainColor;
    [self creatMenuView];
}

@end
