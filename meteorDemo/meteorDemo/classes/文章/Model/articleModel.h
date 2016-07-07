//
//  articleModel.h
//  WeProject
//
//  Created by 千锋 on 16/6/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface articleModel : NSObject<YYModel>


/**
 *  标题
 */
@property(nonatomic,strong)NSString *title;

/**
 *  图片
 */
@property(nonatomic,strong)NSString *img;

/**
 *  新闻来源
 */
@property(nonatomic,strong)NSString *feed_title;

/**
 *  时间
 */
@property(nonatomic,strong)NSString *time;


@property(nonatomic,strong)NSString *ids;

@end
