//
//  LXArticalViewController.h
//  meteorDemo
//
//  Created by liuxing on 16/7/8.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXArticalViewController : UIViewController

//AFNet的管理员
@property (nonatomic,strong)AFHTTPSessionManager *requestManager;



- (instancetype)initWithArticleID:(NSString *)articleID;

@end
