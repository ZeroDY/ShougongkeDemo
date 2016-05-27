//
//  DYMenu.m
//  iOSTestProject
//
//  Created by 周德艺 on 16/5/25.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYMenuView.h"
#import "Masonry.h"
#import "DYMenuItem.h"
#import "CourseCategory.h"
#import "DYMenuDataModel.h"

#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width

#define ItemBgColor       [UIColor colorWithRed:241/255.0f green:242/255.0f blue:244/255.0f alpha:1]
#define BgViewColor       [UIColor colorWithWhite:0 alpha:0.5]

#define LineColor         [UIColor lightGrayColor]
#define CollectionViewBgColor     [UIColor whiteColor]

#define MenuItemTagAdd  1000
#define MenuCellHeight  40

static NSString *dyMenuCollectionCellIdentifier = @"DYMenuCollectionCell";

@interface DYMenuView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NSArray *menuDataArray;
@property (nonatomic, copy) NSArray *collectionDataArray;
@property (nonatomic, strong) NSMutableArray *menuItemArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIView *itemContainerView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) DYMenuItem *currentItem;
@property (nonatomic, copy) DYMenuSelectIndexBlock selectBlock;

@end

@implementation DYMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuItemArray = [NSMutableArray array];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.backgroundView];
        [self addSubview:self.collectionView];
        [self addSubview:self.bottomBtn];
        [self addSubview:self.itemContainerView];
    }
    return self;
}


- (void)configureViewWith:(NSArray *)menuDataArray selectIndex:(DYMenuSelectIndexBlock)block{
    self.menuDataArray = menuDataArray;
    self.selectBlock = block;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
    }];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.itemContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.itemContainerView.mas_top);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(0);
    }];
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.collectionView.mas_bottom);
    }];
    
    UIView *lastView = nil;
    UIView *lastBtn = nil;
    for (NSInteger i = 0; i < self.menuDataArray.count; i++) {
        DYMenuItem *item = [DYMenuItem new];
        item.tag = i + MenuItemTagAdd;
        [item setSelectedIndex:0];
        [item.titleLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightThin]];
        [item setTitleColor:self.deselectColor forState:UIControlStateNormal];
        [item setTitleColor:self.selectedColor forState:UIControlStateSelected];
        [item setImage:[UIImage imageNamed:@"dymenu_normal"] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:@"dymenu_selected"] forState:UIControlStateSelected];
        [item addTarget:self action:@selector(menuItemClick:) forControlEvents:UIControlEventTouchUpInside];
        DYMenuDataModel *model = self.menuDataArray[i][0];
        [item setTitle:model.title forState:UIControlStateNormal];
        [self.menuItemArray addObject:item];
        [self.itemContainerView addSubview:item];
        
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self.itemContainerView);
            if (lastView) {
                make.left.mas_equalTo(lastView.mas_right);
                make.width.mas_equalTo(lastBtn.mas_width);
            }else{
                make.left.mas_equalTo(self.itemContainerView.mas_left);
            }
        }];
        
        lastView = item;
        lastBtn = item;
        
        if (i < self.menuDataArray.count - 1) {
            UIView *line = [UIView new];
            line.backgroundColor = LineColor;
            [self.itemContainerView addSubview:line];
            
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.itemContainerView.mas_centerY);
                make.width.mas_equalTo(0.5);
                make.height.mas_equalTo(lastView.mas_height).offset(-20);
                make.left.mas_equalTo(lastView.mas_right);
            }];
            lastView = line;
        }
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.itemContainerView.mas_right);
    }];
    
}


#pragma mark collectionView代理方法

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DYMenuCollectionViewCell *cell = (DYMenuCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:dyMenuCollectionCellIdentifier forIndexPath:indexPath];
    DYMenuDataModel *model = self.collectionDataArray[indexPath.row];
    [cell configuraCellWith:model];
    if (self.currentItem.selectedIndex == indexPath.row) {
        [cell.title_lab setTextColor:self.selectedColor];
    }else{
        [cell.title_lab setTextColor:self.deselectColor];
    }
    return cell;
}
//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.currentItem setSelectedIndex:indexPath.row];
    DYMenuDataModel *model = self.collectionDataArray[indexPath.row];
    [self.currentItem setTitle:model.title forState:UIControlStateNormal];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    
    self.selectBlock(self.currentItem.tag - MenuItemTagAdd,self.currentItem.selectedIndex);
    [self takeBackCollectionView];
}

#pragma mark - Animation


- (void)menuItemClick:(DYMenuItem *)sender{
    NSUInteger index =  sender.tag - MenuItemTagAdd;
    
    for (DYMenuItem *item in self.menuItemArray) {
        if (item == sender) {
            item.selected =! item.selected;
            self.currentItem = item;
        }else{
            item.selected = NO;
        }
    }
    
    if (sender.selected) {
        self.collectionDataArray = self.menuDataArray[index];
        CGFloat collectionViewHeight =  self.collectionDataArray.count * MenuCellHeight;
        CGFloat collectionViewHeight2 =
        self.collectionDataArray.count%2 == 1? (self.collectionDataArray.count/2+1) * MenuCellHeight : self.collectionDataArray.count/2 * MenuCellHeight;
        if (collectionViewHeight < SCREENHEIGHT*0.6) {
            [self expandWithCollectionViewHeight:collectionViewHeight cellNumOfRow:1];
        }
        else if (collectionViewHeight2 > SCREENHEIGHT*0.6) {
            [self expandWithCollectionViewHeight:SCREENHEIGHT*0.6 cellNumOfRow:2];
        }else{
            [self expandWithCollectionViewHeight:collectionViewHeight2 cellNumOfRow:2];
        }
    }else {
        [self takeBackCollectionView];
    }
}

//展开。
-(void)expandWithCollectionViewHeight:(CGFloat )collectionViewHeight cellNumOfRow:(NSInteger)num
{
    self.flowLayout.itemSize = CGSizeMake(SCREENWIDTH/num, 40);
    [self.collectionView reloadData];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(SCREENHEIGHT);
    }];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.backgroundColor = BgViewColor;
    }];
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(collectionViewHeight);
        make.top.mas_equalTo(self.itemContainerView.mas_top).offset(40);
    }];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

//收起。
-(void)takeBackCollectionView
{
    self.currentItem.selected = NO;
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
        make.top.mas_equalTo(self.itemContainerView.mas_top);
    }];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
        self.backgroundView.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
        }];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    }];
}

#pragma mark - getter setter
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = [UIColor clearColor];
        [_backgroundView setUserInteractionEnabled:true];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(takeBackCollectionView)];
        [_backgroundView addGestureRecognizer:tapGesture];
    }
    return _backgroundView;
}

- (UIView *)itemContainerView{
    if (!_itemContainerView) {
        _itemContainerView = [UIView new];
        _itemContainerView.backgroundColor = ItemBgColor;
        _itemContainerView.layer.borderWidth = 0.5;
        _itemContainerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _itemContainerView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        [_collectionView registerClass:[DYMenuCollectionViewCell class] forCellWithReuseIdentifier:dyMenuCollectionCellIdentifier];
        _collectionView.backgroundColor = CollectionViewBgColor;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (UIButton *)bottomBtn{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton new];
        _bottomBtn.backgroundColor = ItemBgColor;
        [_bottomBtn setImage:[UIImage imageNamed:@"up_back"] forState:UIControlStateNormal];
        [_bottomBtn addTarget:self action:@selector(takeBackCollectionView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (UIColor *)selectedColor{
    if (!_selectedColor) {
        _selectedColor = [UIColor redColor];
    }
    return _selectedColor;
}

- (UIColor *)deselectColor{
    if (!_deselectColor) {
        _deselectColor = [UIColor blackColor];
    }
    return _deselectColor;
}

@end

















