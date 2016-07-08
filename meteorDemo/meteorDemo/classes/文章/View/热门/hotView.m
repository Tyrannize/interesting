//
//  hotView.m
//  WeProject
//
//  Created by 千锋 on 16/6/27.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "hotView.h"

@implementation hotView


-(instancetype)init
{
    
    if (self = [super init]) {
        
        //在创建时候给一个请求地址、
        self.requestURL =TK_HOT;
        self.cid = @0;
    }
    
    return self;
    
}



@end
