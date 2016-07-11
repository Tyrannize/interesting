//
//  LXPublishViewController.m
//  meteorDemo
//
//  Created by liuxing on 16/7/9.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXPublishViewController.h"

@interface LXPublishViewController ()

@end

@implementation LXPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加标语
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    //sloganView.y = LXScreenH * 0.2;
    sloganView.center = CGPointMake(LXScreenW * 0.5, LXScreenH * 0.2);
    
    [self.view addSubview:sloganView];
    
    //数据
    NSArray *images = @[@"publish-video",@"publish-picture",@"publish-text",@"publish-audio",@"publish-review",@"publish-offline"];
    NSArray *titles = @[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖",@"离线下载"];
    
    //中间的子控件
    int maxCols = 3;
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    CGFloat buttonStartY = (LXScreenH - 2 * buttonH) * 0.5;
    CGFloat buttonStartX = 20;
    CGFloat xMargin = (LXScreenW - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);
    for (int i = 0; i < images.count; i++) {
        LXVerticalButton *button = [[LXVerticalButton alloc] init];
        //设置button内容
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        //设置frame
        button.width = buttonW;
        button.height = buttonH;
        int row = i / maxCols;
        int col = i % maxCols;;
        button.x = buttonStartX + col * (xMargin + buttonW);
        button.y = buttonStartY + row * buttonH;
        [self.view addSubview:button];
    }
    
}


- (IBAction)button:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
