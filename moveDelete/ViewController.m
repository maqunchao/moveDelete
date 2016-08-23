//
//  ViewController.m
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/9.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import "ViewController.h"
#import "third.h"
#import "ScrollViewButton.h"
#import "SelectCollectionV.h"
#import "ColumnReusableView.h"
#import "CoclumnCollectionViewCell.h"

#define SPACE 10.0

static NSString *cellIdentifier = @"CoclumnCollectionViewCell";
static NSString *headOne = @"ColumnReusableViewOne";
static NSString *headTwo = @"ColumnReusableViewTwo";


@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource,DeleteDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *topView;//scrollView背景的view
@property (nonatomic, strong) UIButton *moreButton;//跳转到buttonView
@property (nonatomic, strong) ScrollViewButton *buttonScrollV;
@property (nonatomic, strong) SelectCollectionV *SelectV;
@property (nonatomic, strong) UIView *newsListView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    self.view.backgroundColor = [UIColor yellowColor];
=======
    self.view.backgroundColor = [UIColor whiteColor];
>>>>>>> master
    

    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT/ 18)];
//    self.topView.backgroundColor = [UIColor blueColor];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];

    
    

#pragma mark -- 创建按钮的滚动视图
    [self creatButtonScrollV];

    _newsListView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height + 20, SCREEN_WIDTH, self.view.frame.size.height - self.topView.frame.origin.y - self.topView.frame.size.height - 66)];
    
    [self.view addSubview:_newsListView];
    _newsListView.backgroundColor = [UIColor redColor];
    
    self.buttonScrollV.backgroundColor = [UIColor blueColor];
    self.buttonScrollV.buttonArr = [NSMutableArray arrayWithObjects:@"头条",@"热点",@"体育",@"本地",@"财经",@"科技",@"图片",@"跟帖",@"直播",@"时尚",@"汽车",@"轻松一刻",@"汽车",@"端子",@"军事",@"房产",@"历史",@"家居",@"原创",@"游戏", nil];
//    self.buttonScrollV.collectionView.delegate = self;
    
    
    self.SelectV = [[SelectCollectionV alloc] initWithFrame:CGRectMake(0, -self.newsListView.frame.size.height - 60, SCREEN_WIDTH, SCREEN_HEIGHT)];

    
    
    [self.SelectV setHidden:YES];
    self.SelectV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.SelectV];
    
    NSArray *selectedArray = @[@"头条",@"热点",@"体育",@"本地",@"财经",@"科技",@"图片",@"跟帖",@"直播",@"时尚",@"汽车",@"轻松一刻",@"汽车",@"端子",@"军事",@"房产",@"历史",@"家居",@"原创",@"游戏"];
    NSArray *optionalArray = @[@"NBA",@"画报",@"跑步",@"值得买",@"酒香",@"LOL",@"社会",@"暴雪游戏帖",@"云课堂",@"旅游",@"读书",@"葡萄酒",@"你照吗",@"移动互联",@"情感",@"博客",@"论坛",@"数码",@"国际足球",@"彩票",@"股票",@"哒哒",@"漫画"];
    [self.SelectV.selectedArray addObjectsFromArray:selectedArray];
    [self.SelectV.optionalArray addObjectsFromArray:optionalArray];
    self.SelectV.collectionView.delegate = self;
    self.SelectV.collectionView.dataSource = self;
    self.SelectV.backgroundColor = [UIColor blueColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- 按钮滚动视图
-(void)creatButtonScrollV
{
    
    
    self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.moreButton.frame = CGRectMake(self.topView.frame.size.width - 40, 20, 40, SCREEN_HEIGHT/ 18);
    
    [self.moreButton setImage:[UIImage imageNamed:@"down"] forState:(UIControlStateNormal)];
    [self.topView addSubview:self.moreButton];
    
    [self.moreButton addTarget:self action:@selector(showSelectView:) forControlEvents:(UIControlEventTouchUpInside)];
    
#pragma mark  创建最上方滑动按钮视图
    self.buttonScrollV = [[ScrollViewButton alloc] initWithFrame:CGRectMake(0, self.topView.frame.origin.y, SCREEN_WIDTH - 40, 30)];
    
    
    
    [self.topView addSubview:self.buttonScrollV];

}

-(void)showSelectView:(UIButton *)button
{
    if ([self.SelectV isHidden] == YES) {
        
        [self.SelectV setHidden:NO];
        [UIView animateWithDuration:0.6 animations:^{
            [self.SelectV setFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height + 20 , SCREEN_WIDTH, SCREEN_HEIGHT )];
        } completion:^(BOOL finished) {
            [self.moreButton setImage:[UIImage imageNamed:@"up"] forState:(UIControlStateNormal)];
            
        }];

    } else {
        [UIView animateWithDuration:0.6 animations:^{
            [self.SelectV setFrame:CGRectMake(0, -self.newsListView.frame.size.height - 80, SCREEN_WIDTH, SCREEN_HEIGHT)];
            
        } completion:^(BOOL finished) {
            [self.moreButton setImage:[UIImage imageNamed:@"down"] forState:(UIControlStateNormal)];
            [self.SelectV setHidden:YES];
            
        }];

    }
    
}
#pragma mark ----------------- delete ---------------------
-(void)deleteItemWithIndexPath:(NSIndexPath *)indexPath{
    //数据整理
    [self.SelectV.optionalArray insertObject:[self.SelectV.selectedArray objectAtIndex:indexPath.row] atIndex:0];
    [self.SelectV.selectedArray removeObjectAtIndex:indexPath.row];
    [self.SelectV.collectionView deleteItemsAtIndexPaths:@[indexPath]];
#pragma mark -- 滑动的按钮 添加
    self.buttonScrollV.buttonArr = self.SelectV.selectedArray;
    [self.buttonScrollV.collectionView reloadData];

    //删除之后更新collectionView上对应cell的indexPath
    for (NSInteger i = 0; i < self.SelectV.selectedArray.count; i++) {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
        CoclumnCollectionViewCell *cell = (CoclumnCollectionViewCell *)[self.SelectV.collectionView cellForItemAtIndexPath:newIndexPath];
        cell.indexPath = newIndexPath;
    }
    
}

//点击移动的动画
#pragma mark ----------------- insert ---------------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    if ([collectionView isEqual:self.buttonScrollV.collectionView]) {
//        
//        if (self.buttonScrollV.buttonArr.count > 6) {
//            [self.buttonScrollV.collectionView setContentOffset:(CGPointMake(60 * (self.buttonScrollV.buttonArr.count - 3), 0)) animated:YES];
//        }
//        
//        self.buttonScrollV.item = indexPath.item;
//        [self.buttonScrollV.collectionView reloadData];
//    }
//    if ([collectionView isEqual:self.SelectV.collectionView]){
    
    
    if (indexPath.section == 0) {
        
        
    
        self.buttonScrollV.item = indexPath.item;
        [self.buttonScrollV.collectionView reloadData];
        CGFloat offsetX = SCREEN_WIDTH / 6 * indexPath.item  - 3 * SCREEN_WIDTH / 6 ;
        if (offsetX < 0) {
            offsetX = 0;
        }
        CGFloat MaxOffsetX = (SCREEN_WIDTH / 3.5) * indexPath.item - SCREEN_WIDTH / 6;
        NSLog(@"%lf", MaxOffsetX);
        if (offsetX > MaxOffsetX) {
            
            offsetX = MaxOffsetX;
        }
        [self.buttonScrollV.collectionView setContentOffset:(CGPointMake(offsetX, 0)) animated:YES];

        
        [self showSelectView:self.moreButton];
    }
    
    
    if (indexPath.section == 1) {
        self.SelectV.lastIsHidden = YES;
        
        CoclumnCollectionViewCell *endCell = (CoclumnCollectionViewCell *)[self.SelectV.collectionView cellForItemAtIndexPath:indexPath];
        endCell.contentLabel.hidden = YES;
        
        [self.SelectV.selectedArray addObject:[self.SelectV.optionalArray objectAtIndex:indexPath.row]];
        [self.SelectV.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
#pragma mark -- 滑动的按钮 添加
        self.buttonScrollV.buttonArr = self.SelectV.selectedArray;
        [self.buttonScrollV.collectionView reloadData];
        
        //移动开始的attributes
        UICollectionViewLayoutAttributes *startAttributes = [self.SelectV.collectionView layoutAttributesForItemAtIndexPath:indexPath];
        
        self.SelectV.animationLabel.frame = CGRectMake(startAttributes.frame.origin.x, startAttributes.frame.origin.y, startAttributes.frame.size.width , startAttributes.frame.size.height);
        self.SelectV.animationLabel.layer.cornerRadius = CGRectGetHeight(self.SelectV.animationLabel.bounds) * 0.5;
        self.SelectV.animationLabel.text = [self.SelectV.optionalArray objectAtIndex:indexPath.row];
        [self.SelectV.collectionView addSubview:self.SelectV.animationLabel];
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:self.SelectV.selectedArray.count-1 inSection:0];
        
        //移动终点的attributes
        UICollectionViewLayoutAttributes *endAttributes = [self.SelectV.collectionView layoutAttributesForItemAtIndexPath:toIndexPath];
        
        typeof(self) __weak weakSelf = self;
        //移动动画
        [UIView animateWithDuration:0.7 animations:^{
            weakSelf.SelectV.animationLabel.center = endAttributes.center;
        } completion:^(BOOL finished) {
            //展示最后一个cell的contentLabel
            CoclumnCollectionViewCell *endCell = (CoclumnCollectionViewCell *)[weakSelf.SelectV.collectionView cellForItemAtIndexPath:toIndexPath];
            endCell.contentLabel.hidden = NO;
            
            weakSelf.SelectV.lastIsHidden = NO;
            [weakSelf.SelectV.animationLabel removeFromSuperview];
            [weakSelf.SelectV.optionalArray removeObjectAtIndex:indexPath.row];
            [weakSelf.SelectV.collectionView deleteItemsAtIndexPaths:@[indexPath]];
        }];
        
    }
//    }
}

#pragma mark ----------------- item(样式) ---------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_SIZE.width - (5*SPACE)) / 4.0, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(SPACE, SPACE, SPACE, SPACE);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return SPACE;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return SPACE;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(SCREEN_SIZE.width, 40.0);
    }
    else{
        return CGSizeMake(SCREEN_SIZE.width, 30.0);
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return  CGSizeMake(SCREEN_SIZE.width, 0.0);
}

#pragma mark ----------------- collectionView(datasouce) ---------------------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.SelectV.isSort) {
        return 1;
    }
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.SelectV.selectedArray.count;
    }
    else{
        return self.SelectV.optionalArray.count;
    }
}

#pragma mark -- block 点击 排序删除
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ColumnReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headOne forIndexPath:indexPath];
            reusableView.buttonHidden = NO;
            reusableView.clickButton.selected = self.SelectV.isSort;
            reusableView.backgroundColor = [UIColor whiteColor];
            typeof(self) __weak weakSelf = self;
            [reusableView clickWithBlock:^(ButtonState state) {
                //排序删除
                if (state == StateSortDelete) {
                    weakSelf.SelectV.isSort = YES;
                }
                //完成
                else{
                    weakSelf.SelectV.isSort = NO;
                    if (weakSelf.SelectV.cellAttributesArray.count) {
                        for (UICollectionViewLayoutAttributes *attributes in weakSelf.SelectV.cellAttributesArray) {
                            CoclumnCollectionViewCell *cell = (CoclumnCollectionViewCell *)[weakSelf.SelectV.collectionView cellForItemAtIndexPath:attributes.indexPath];
                            for (UIPanGestureRecognizer *pan in cell.gestureRecognizers) {
                                [cell removeGestureRecognizer:pan];
                            }
                        }
                    }
                }
                [weakSelf.SelectV.collectionView reloadData];
            }];
            reusableView.titleLabel.text = @"已选栏目";
            
        }else{
            reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headTwo forIndexPath:indexPath];
            reusableView.buttonHidden = YES;
            reusableView.backgroundColor = RGBA(240, 240, 240, 1);
            reusableView.titleLabel.text = @"点击添加更多栏目";
        }
    }
    return (UICollectionReusableView *)reusableView;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CoclumnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        [cell configCell:self.SelectV.selectedArray withIndexPath:indexPath];
        //头条
        if (indexPath.row == 0) {
            cell.deleteButton.hidden = YES;
        }else{
#pragma mark -- 设置代理
            cell.deleteDelegate = self;
            cell.deleteButton.hidden = !self.SelectV.isSort;
            if (self.SelectV.isSort) {
                UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(sortItem:)];
                [cell addGestureRecognizer:pan];
            }
            else{
                
            }
            //最后一位是否隐藏(为了动画效果)
            if (indexPath.row == self.SelectV.selectedArray.count - 1) {
                cell.contentLabel.hidden = self.SelectV.lastIsHidden;
            }
        }
        
    }else{
        [cell configCell:self.SelectV.optionalArray withIndexPath:indexPath];
        cell.deleteButton.hidden = YES;
    }
    return cell;
}
#pragma mark ----------------- sort ---------------------
-(void)sortItem:(UIPanGestureRecognizer *)pan{
    CoclumnCollectionViewCell *cell = (CoclumnCollectionViewCell *)pan.view;
    NSIndexPath *cellIndexPath = [self.SelectV.collectionView indexPathForCell:cell];
    
    //开始  获取所有cell的attributes
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.SelectV.cellAttributesArray removeAllObjects];
        for (NSInteger i = 0 ; i < self.SelectV.selectedArray.count; i++) {
            [self.SelectV.cellAttributesArray addObject:[self.SelectV.collectionView layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
        }
    }
    
    CGPoint point = [pan translationInView:self.SelectV.collectionView];
    cell.center = CGPointMake(cell.center.x + point.x, cell.center.y + point.y);
    [pan setTranslation:CGPointMake(0, 0) inView:self.SelectV.collectionView];
    
    //进行是否排序操作
    BOOL ischange = NO;
    for (UICollectionViewLayoutAttributes *attributes in self.SelectV.cellAttributesArray) {
        CGRect rect = CGRectMake(attributes.center.x - 6, attributes.center.y - 6, 12, 12);
        if (CGRectContainsPoint(rect, CGPointMake(pan.view.center.x, pan.view.center.y)) & (cellIndexPath != attributes.indexPath)) {
            
            //后面跟前面交换
            if (cellIndexPath.row > attributes.indexPath.row) {
                //交替操作0 1 2 3 变成（3<->2 3<->1 3<->0）
                for (NSInteger index = cellIndexPath.row; index > attributes.indexPath.row; index -- ) {
                    [self.SelectV.selectedArray exchangeObjectAtIndex:index withObjectAtIndex:index - 1];
                }
            }
            //前面跟后面交换
            else{
                //交替操作0 1 2 3 变成（0<->1 0<->2 0<->3）
                for (NSInteger index = cellIndexPath.row; index < attributes.indexPath.row; index ++ ) {
                    [self.SelectV.selectedArray exchangeObjectAtIndex:index withObjectAtIndex:index + 1];
                }
            }
            ischange = YES;
            [self.SelectV.collectionView moveItemAtIndexPath:cellIndexPath toIndexPath:attributes.indexPath];
        }
        else{
            ischange = NO;
        }
    }
    
    //结束
    if (pan.state == UIGestureRecognizerStateEnded){
        if (ischange) {
            
        }
        else{
            cell.center = [self.SelectV.collectionView layoutAttributesForItemAtIndexPath:cellIndexPath].center;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
