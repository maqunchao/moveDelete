//
//  ScrollViewButton.h
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/10.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewButton : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *buttonArr;

//接收传过来的item , 改变选中单元格的字体颜色
@property (nonatomic, assign) NSInteger item;

@end
