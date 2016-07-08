//
//  baseView.h
//  WeProject
//
//  Created by 千锋 on 16/6/27.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol jumpDelegate <NSObject>

- (void)jumpToDetailWithIDs:(NSString *)ids;

@end


@interface baseView : UIView


@property (nonatomic,strong) id<jumpDelegate> delegate;


@property(nonatomic,strong)UITableView *TableView;

//创建AF管理员

//AFNet的管理员
@property (nonatomic,strong)AFHTTPSessionManager *requestManager;

@property(nonatomic,strong)NSString *requestURL;

//参数
@property(nonatomic,assign)NSNumber *cid;



@end
