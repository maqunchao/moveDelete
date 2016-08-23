//
//  third.h
//  oilgasDataApp
//
//  Created by pengdunshiyou on 16/4/18.
//  Copyright © 2016年 pengdunshiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface third : NSObject

#define STATUS_BAR_HEIGHT 20

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define RGBA(r,g,b,a)      [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@end
