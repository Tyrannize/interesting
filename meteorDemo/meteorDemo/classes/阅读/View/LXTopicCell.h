//
//  LXTopicCell.h
//  meteorDemo
//
//  Created by liuxing on 16/7/11.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXTopic;

@interface LXTopicCell : UITableViewCell

/**获取帖子数据*/
@property (nonatomic,strong) LXTopic *topic;

@end
