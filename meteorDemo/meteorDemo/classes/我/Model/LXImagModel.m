//
//  LXImagModel.m
//  meteorDemo
//
//  Created by liuxing on 16/7/6.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXImagModel.h"

@implementation LXImagModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        if (dict[@"id"]) {
            [self setValue:dict[@"id"] forKey:@"image_id"];
        }
        
    }
    
    return self;
}

+ (instancetype)imageModelWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}


@end
