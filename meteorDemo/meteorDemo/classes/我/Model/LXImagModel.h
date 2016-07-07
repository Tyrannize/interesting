//
//  LXImagModel.h
//  meteorDemo
//
//  Created by liuxing on 16/7/6.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXImagModel : NSObject

@property (nonatomic,copy) NSString *image_id;

@property (nonatomic,assign) float w;

@property (nonatomic,assign) float h;

@property (nonatomic,copy) NSString *src;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)imageModelWithDict:(NSDictionary *)dict;

@end
