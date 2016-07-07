//
//  LXarticleUViewController.h
//  meteorDemo
//
//  Created by liuxing on 16/7/6.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXarticleUViewController : UIViewController

//AFNet的管理员
@property (nonatomic,strong)AFHTTPSessionManager *requestManager;

- (instancetype)initWithArticleID:(NSString *)articleID;


//请求路径
@property(nonatomic,strong)NSString *requestURL;


@end
