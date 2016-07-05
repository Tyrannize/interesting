//
//  UIBarButtonItem+LXbtn.m
//  meteorDemo
//
//  Created by liuxing on 16/7/4.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "UIBarButtonItem+LXbtn.h"

@implementation UIBarButtonItem (LXbtn)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
