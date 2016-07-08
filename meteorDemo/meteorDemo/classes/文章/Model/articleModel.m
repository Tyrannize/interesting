//
//  articleModel.m
//  WeProject
//
//  Created by 千锋 on 16/6/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "articleModel.h"

@implementation articleModel

+(NSDictionary *)modelCustomPropertyMapper
{
    //将关键字进行转换
    return @{@"ids":@"id"};
}


@end
