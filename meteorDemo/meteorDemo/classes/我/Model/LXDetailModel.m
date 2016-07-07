//
//  LXDetailModel.m
//  meteorDemo
//
//  Created by liuxing on 16/7/6.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXDetailModel.h"
#import "LXImagModel.h"

@implementation LXDetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSLog(@"bbb");
        if (dict[@"images"]) {
            NSLog(@"there is some images inside");
            NSMutableArray *imgArray = [NSMutableArray array];
            for (NSDictionary *imgDict in dict[@"images"]) {
               LXImagModel *imgModel = [LXImagModel imageModelWithDict:imgDict];
                [imgArray addObject:imgModel];
            }
            self.images = imgArray;
        }
    }
    return self;
}

+ (instancetype)detailModelWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

@end
