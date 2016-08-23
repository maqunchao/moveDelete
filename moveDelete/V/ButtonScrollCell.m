//
//  ButtonScrollCell.m
//  moveDelete
//
//  Created by pengdunshiyou on 16/8/10.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import "ButtonScrollCell.h"

@implementation ButtonScrollCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, frame.size.height)];
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}

@end
