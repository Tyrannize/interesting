//
//  UIBarButtonItem+LXbtn.h
//  meteorDemo
//
//  Created by liuxing on 16/7/4.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LXbtn)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
