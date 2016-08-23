//
//  SelectCollectionV.m
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/10.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import "SelectCollectionV.h"
#import "third.h"
#import "CoclumnCollectionViewCell.h"
#import "ColumnReusableView.h"
#define SPACE 10.0

static NSString *cellIdentifier = @"CoclumnCollectionViewCell";
static NSString *headOne = @"ColumnReusableViewOne";
static NSString *headTwo = @"ColumnReusableViewTwo";
//@interface SelectCollectionV ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DeleteDelegate>
//
//@end
@implementation SelectCollectionV


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.selectedArray = [[NSMutableArray alloc] init];
        self.optionalArray = [[NSMutableArray alloc] init];
        
        self.cellAttributesArray = [[NSMutableArray alloc] init];
        
        self.animationLabel = [[UILabel alloc] init];
        self.animationLabel.textAlignment = NSTextAlignmentCenter;
        self.animationLabel.font = [UIFont systemFontOfSize:15];
        self.animationLabel.numberOfLines = 1;
        self.animationLabel.adjustsFontSizeToFitWidth = YES;
        self.animationLabel.minimumScaleFactor = 0.1;
        self.animationLabel.textColor = RGBA(101, 101, 101, 1);
        self.animationLabel.layer.masksToBounds = YES;
        self.animationLabel.layer.borderColor = RGBA(211, 211, 211, 1).CGColor;
        self.animationLabel.layer.borderWidth = 0.45;
                NSLog(@"个数%lu", (unsigned long)self.selectedArray.count);
        
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
//        self.collectionView.dataSource = self;
//        self.collectionView.delegate = self;
        self.collectionView.alwaysBounceVertical = YES;
        
        [self addSubview:self.collectionView];
        
        [self.collectionView registerClass:[CoclumnCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        [self.collectionView registerClass:[ColumnReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headOne];
        [self.collectionView registerClass:[ColumnReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headTwo];
        [self.collectionView reloadData];


    }
    return self;
}



@end
