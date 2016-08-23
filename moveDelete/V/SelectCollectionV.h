//
//  SelectCollectionV.h
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/10.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCollectionV : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign)BOOL isSort;

@property (nonatomic, assign)BOOL lastIsHidden;
/**
 *  animation label（insert）
 */
@property (nonatomic, strong)UILabel *animationLabel;
/**
 *  attributes of all cells
 */
@property (nonatomic, strong)NSMutableArray *cellAttributesArray;


/**
 *  已选的数据
 */
@property (nonatomic, strong)NSMutableArray *selectedArray;
/**
 *  可选的数据
 */
@property (nonatomic, strong)NSMutableArray *optionalArray;


@end
