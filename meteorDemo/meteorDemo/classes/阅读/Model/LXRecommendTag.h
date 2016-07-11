//
//  LXRecommendTag.h
//  meteorDemo
//
//  Created by liuxing on 16/7/11.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXRecommendTag : NSObject

/**图片*/
@property (nonatomic,copy) NSString *image_list;
/**名字*/
@property (nonatomic,copy) NSString *theme_name;
/**订阅数*/
@property (nonatomic,assign) NSInteger *sub_number;

@end
