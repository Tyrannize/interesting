//
//  LXRecommendTagCell.m
//  meteorDemo
//
//  Created by liuxing on 16/7/11.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXRecommendTagCell.h"
#import "LXRecommendTag.h"
#import <UIImageView+WebCache.h>

@interface LXRecommendTagCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;

@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation LXRecommendTagCell

- (void)setRecommendTag:(LXRecommendTag *)recommendTag {
    _recommendTag = recommendTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommendTag.theme_name;
    NSString *subNumber = nil;
    if ((long)recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    }else {
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",(long)recommendTag.sub_number / 10000.0];
    }
    self.subNumberLabel.text = subNumber;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    
    [super setFrame:frame];
}

@end
