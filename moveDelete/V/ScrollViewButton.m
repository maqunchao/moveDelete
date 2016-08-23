//
//  ScrollViewButton.m
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/10.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import "ScrollViewButton.h"
#import "UIView+Extension.h"
#import "ButtonScrollCell.h"
#import "third.h"


@interface ScrollViewButton ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ScrollViewButton



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(frame.size.width / 6, frame.size.width);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        
        [self.collectionView registerClass:[ButtonScrollCell class] forCellWithReuseIdentifier:@"one"];
        [self addSubview:self.collectionView];
        
        self.collectionView.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

-(void)setButtonArr:(NSMutableArray *)buttonArr
{
    _buttonArr = [NSMutableArray arrayWithArray:buttonArr];
    NSLog(@"%lu", _buttonArr.count);
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.buttonArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ButtonScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"one" forIndexPath:indexPath];
    NSLog(@"%@", self.buttonArr[indexPath.item]);
    cell.label.text = self.buttonArr[indexPath.item];
    
    if (indexPath.item == self.item) {
        cell.label.font = [UIFont systemFontOfSize:16];
        cell.label.textColor = [UIColor redColor];
    }else{
        cell.label.font = [UIFont systemFontOfSize:16];
        cell.label.textColor = [UIColor blackColor];
    }
    
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (self.buttonArr.count > 6) {
//        [self.collectionView setContentOffset:(CGPointMake(60 * (self.buttonArr.count - 3), 0)) animated:YES];
//    }
    
    self.item = indexPath.item;
    CGFloat offsetX = SCREEN_WIDTH / 6 * indexPath.item  - 3 * SCREEN_WIDTH / 6 ;
    if (offsetX < 0) {
        offsetX = 0;
    }
    CGFloat MaxOffsetX = (SCREEN_WIDTH / 3) * indexPath.item - SCREEN_WIDTH / 6;
    NSLog(@"%lf", MaxOffsetX);
    if (offsetX > MaxOffsetX) {
        
        offsetX = MaxOffsetX;
    }
    [self.collectionView setContentOffset:(CGPointMake(offsetX, 0)) animated:YES];
    [self.collectionView reloadData];
}



@end
