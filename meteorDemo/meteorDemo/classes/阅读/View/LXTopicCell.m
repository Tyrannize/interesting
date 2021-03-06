//
//  LXTopicCell.m
//  meteorDemo
//
//  Created by liuxing on 16/7/11.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXTopicCell.h"
#import "LXTopic.h"
#import <UIImageView+WebCache.h>

@interface LXTopicCell()

/**头像*/
@property (weak, nonatomic) IBOutlet UIImageView *profileIMageView;
/**昵称*/
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
/**时间*/
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
/**赞*/
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
/**踩*/
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
/**分享*/
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
/**评论*/
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation LXTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

- (void)setTopic:(LXTopic *)topic
{
    _topic = topic;
    
    // 设置头像
    [self.profileIMageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    // 设置名字
    self.namelabel.text = topic.name;
    
    // 设置帖子的创建时间
    self.createTimeLabel.text = topic.create_time;
    
    // 设置按钮文字
    [self setupButtonTitle:self.dingButton count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiButton count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareButton count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentButton count:topic.comment placeholder:@"评论"];
}

/**
 * 设置底部按钮文字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder
{
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame
{
    static CGFloat margin = 10;
    
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= margin;
    frame.origin.y += margin;
    
    [super setFrame:frame];
}



@end
