//
//  LXDetailModel.h
//  meteorDemo
//
//  Created by liuxing on 16/7/6.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXDetailModel : NSObject

@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,copy) NSString *feed_title;

@property (nonatomic,copy) NSString *time;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)detailModelWithDict:(NSDictionary *)dict;

@end
