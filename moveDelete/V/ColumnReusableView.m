//
//  ColumnReusableView.m
//  Column
//
//  Created by fujin on 15/11/19.
//  Copyright © 2015年 fujin. All rights reserved.
//

#import "ColumnReusableView.h"
#import "third.h"
@interface ColumnReusableView ()
@property (nonatomic, copy)ClickBlock clickBlock;

@end
@implementation ColumnReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self confingSubViews];
    }
    return self;
}
-(void)confingSubViews{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, self.bounds.size.height)];
//    self.titleLabel.backgroundColor = [UIColor blueColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = RGBA(51, 51, 51, 1);
    [self addSubview:self.titleLabel];
    
    self.clickButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width - 80, 10, 60, 20)];
    self.clickButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.clickButton.backgroundColor = [UIColor whiteColor];
    self.clickButton.layer.masksToBounds = YES;
    self.clickButton.layer.cornerRadius = 10;
    self.clickButton.layer.borderColor = RGBA(214, 39, 48, 1).CGColor;
    self.clickButton.layer.borderWidth = 0.7;
    [self.clickButton setTitle:@"排序删除" forState:UIControlStateNormal];
    [self.clickButton setTitle:@"完成" forState:UIControlStateSelected];
    [self.clickButton setTitleColor:RGBA(214, 39, 48, 1) forState:UIControlStateNormal];
    [self.clickButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clickButton];
}
-(void)clickWithBlock:(ClickBlock)clickBlock{
    if (clickBlock) {
        self.clickBlock = clickBlock;
    }
}
-(void)clickAction:(UIButton *)sender{
    self.clickButton.selected = !self.clickButton.selected;
    if (sender.selected) {
        self.clickBlock(StateSortDelete);
    }else{
        self.clickBlock(StateComplish);
    }
    
}
#pragma mark ----------- set ---------------
-(void)setButtonHidden:(BOOL)buttonHidden{
    if (buttonHidden != _buttonHidden) {
        self.clickButton.hidden = buttonHidden;
        _buttonHidden = buttonHidden;
    }
}
@end
