//
//  articleTableViewCell.m
//  WeProject
//
//  Created by 千锋 on 16/6/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "articleTableViewCell.h"
#import "articleModel.h"

@interface articleTableViewCell()


/**
 *  title高度的约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightConstraints;
/**
 *  title距离右边的宽度约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleToRightMarginConstraint;


//cell 的基本控件

/**
 *  展示标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 *  展示图片
 */
//@property (weak, nonatomic) IBOutlet UIImageView *PictureImage;
@property (weak, nonatomic) IBOutlet UIImageView *PictureImage;

/**
 *  展示时间和来源
 */
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end


@implementation articleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews
{
    
}


/**
 *  计算文字的高度
 */
- (float)getTextRectWithText:(NSString *)text maxSize:(CGSize)maxSize FontSize:(CGFloat)size{
    
    //计算指定文字需要显示的时候的大小
    //参数1:限制显示文字空间的最大宽度和最大高度
    //参数2:渲染模式/NSStringDrawingUsesLineFragmentOrigin
    //参数3:文字属性(只需要设置字体)，显示文字的label字体要小于等于这个字体
    CGRect rect = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    
    return rect.size.height;
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        
       // [self calculateFrame];
        
        
    }
    return self;
}


-(void)calculateFrame
{
    //从新计算控件的frame

    
    
    _PictureImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_PictureImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.mas_right).offset(-8);
        make.top.equalTo(self.mas_top).offset(8);
        make.bottom.equalTo(self.mas_bottom).offset(-8);
        make.width.mas_equalTo(90);
        
    }];
    
    
}



//传入图片和和标题 为label 的约束赋值
-(void)setSize:(NSString *)image title:(NSString *)title
{
     CGFloat sreenW = [UIScreen mainScreen].bounds.size.width;
    
    //当图片存在的时候
    
    BOOL Isblank = [self isBlankString:image];
    
    
    if (Isblank) {
        
        
        //图片的宽度是90 然后把
        //printf("图片存在\n");
        
        self.titleToRightMarginConstraint.constant = 120;
        //设置高度
        self.titleHeightConstraints.constant=[self getTextRectWithText:title maxSize:CGSizeMake(sreenW-108, MAXFLOAT) FontSize:18];
        
    }
    else
    {
        //printf("图片不存在\n");
        //图片不存在的时候
        self.titleHeightConstraints.constant = [self getTextRectWithText:title maxSize:CGSizeMake(sreenW-8, MAXFLOAT) FontSize:18];
    }
}

//通过传入的model给cell 赋值
-(void)setModel:(articleModel *)model
{
    _model = model;
    
    [self setSize:model.img title:model.title];
    
    
    self.titleLabel.text = model.title;
    self.titleLabel.numberOfLines =0;
    
    
    [self.PictureImage setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@""]];
    
    self.infoLabel.text = [NSString stringWithFormat:@"%@    %@",model.feed_title,model.time];
    
}


- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
