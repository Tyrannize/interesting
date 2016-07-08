//
//  LXArticalViewController.m
//  meteorDemo
//
//  Created by liuxing on 16/7/8.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "LXArticalViewController.h"
#import <AFNetworking.h>
#import "define.h"
#import "LXDetailModel.h"
#import "LXImagModel.h"

@interface LXArticalViewController ()

@property (nonatomic,strong) UIWebView *webView;

@property (nonatomic,strong) NSString *requestUrl;

@property (nonatomic,strong) UIToolbar *toolbar;

@property (nonatomic,strong) NSMutableArray *itemArray;

@end

@implementation LXArticalViewController

- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (instancetype)initWithArticleID:(NSString *)articleID {
    if (self = [super init]) {
        //        self.requestUrl = TK_ARTICLES;
        self.requestUrl = [NSString stringWithFormat:@"http://0.0.0.0:tuicool@api.tuicool.com/api/articles/%@.json?is_pad=1&need_image_meta=1",articleID];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    
    [self creatWebView];
    [self requestDataWithDict:nil];
    [self creatUI];
    
}

- (void)creatUI {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    CGRect frame = btn.frame;
    frame.size = btn.currentBackgroundImage.size;
    btn.frame = frame;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender {
    
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self creatToolBar];
    
}

- (void)creatToolBar {
    self.toolbar = [[UIToolbar alloc]init];
    self.toolbar.backgroundColor = [UIColor whiteColor];
    self.toolbar.barTintColor = [UIColor whiteColor];
    [self.view addSubview:self.toolbar];
    self.toolbar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 38, [UIScreen mainScreen].bounds.size.width, 38);
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self barButtonItemByCustomButtonWithImage:@"article_detail_late" highlightedImage:@"" target:self action:@selector(waitClick:)];
    [self.itemArray addObject:fixedSpace];
    
    [self barButtonItemByCustomButtonWithImage:@"star1" highlightedImage:@"star-on" target:self action:@selector(saveClick:)];
    [self.itemArray addObject:fixedSpace];
    
    [self  barButtonItemByCustomButtonWithImage:@"upload" highlightedImage:@"upload" target:self action:@selector(shareClick:)];
    [self.itemArray addObject:fixedSpace];
    
    [self barButtonItemByCustomButtonWithImage:@"bottom_bar_comment" highlightedImage:@"bottom_bar_comment" target:self action:@selector(commentClick:)];
    
    self.toolbar.items = self.itemArray;
    NSLog(@"%@",self.toolbar.items);
    
}

- (void)waitClick:(UIBarButtonItem *)btn {
    NSLog(@"wait");
}
- (void)saveClick:(UIBarButtonItem *)btn {
    NSLog(@"save");
}
- (void)shareClick:(UIBarButtonItem *)btn {
    NSLog(@"share");
}
- (void)commentClick:(UIBarButtonItem *)btn {
    NSLog(@"comment");
}



- (void)barButtonItemByCustomButtonWithImage:(NSString *)imageName
                            highlightedImage:(NSString *)highlightName target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightName] forState:UIControlStateDisabled];
    btn.bounds = CGRectMake(0, 0, 38, 38);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.itemArray addObject:barButtonItem];
}


- (void)creatWebView {
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 38)];
    self.webView.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1.0];
    self.webView.opaque = YES;
    
    [self.view addSubview:self.webView];
    
}

- (void)requestDataWithDict:(NSDictionary *)dictIn {
    
    NSString *cachePath = [NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()];
    NSLog(@"%@",cachePath);
    
    [self.requestManager GET:self.requestUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"加载数据成功");
        //        NSLog(@"%@",responseObject);
        NSURL *htmlFile = [[NSBundle mainBundle] URLForResource:@"article_detail.html" withExtension:nil];
        NSString *htmlString = [NSString stringWithContentsOfURL:htmlFile encoding:NSUTF8StringEncoding error:nil];
        
        NSDictionary *dict = responseObject[@"article"];
        //NSLog(@"%@",responseObject[@"article"]);
        LXDetailModel *model = [[LXDetailModel alloc]initWithDict:dict];
        //NSLog(@"%@",model.content);
        //NSLog(@"%@",model.images);
        NSString *contentString = model.content;
        
        contentString = [self getImageHtmlStringWith:contentString imageArray:model.images];
        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"%@title" withString:model.title];
        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"%@feed" withString:model.feed_title];
        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"%@time" withString:model.time];
        
        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"%@content" withString:contentString];
        NSLog(@"==================/n%@",htmlString);
        
        [self.webView loadHTMLString:htmlString baseURL:htmlFile];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"加载数据失败,error:%@",error);
    }];
    
}

- (NSString *)getImageHtmlStringWith:(NSString *)contentHtmlString
                          imageArray:(NSArray *)images {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<img\\ssrc[^>]*/>" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
    NSArray *result = [regex matchesInString:contentHtmlString options:NSMatchingReportCompletion range:NSMakeRange(0,contentHtmlString.length)];
    NSMutableArray *num = [NSMutableArray array];
    for (NSTextCheckingResult *item in result) {
        NSString *imageHtml = [contentHtmlString substringWithRange:[item rangeAtIndex:0]];
        [num addObject:imageHtml];
    }
    
    for (int i = 0; i < num.count; i++) {
        NSString *imageHtml = num[i];
        for (LXImagModel *model in images) {
            if ([imageHtml rangeOfString:model.image_id].location != NSNotFound) {
                //NSLog(@"%f",model.w);
                //NSLog(@"%@",model.src);
                //NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
                CGFloat sureWidth = model.w > self.webView.bounds.size.width ? self.webView.bounds.size.width - 24:model.w;
                NSString *newImgHtml = [NSString stringWithFormat:@"<img src=\"%@\" width = '%.0f' class=\"alignCenter\" />",model.src,sureWidth];
                // NSLog(@"%@",newImgHtml);
                contentHtmlString = [contentHtmlString stringByReplacingOccurrencesOfString:imageHtml withString:newImgHtml];
            }
        }
    }
    return contentHtmlString;
}

#pragma mark - 请求获取数据
-(AFHTTPSessionManager *)requestManager
{
    if (!_requestManager) {
        
        //实例化时候是个类方法。
        _requestManager = [AFHTTPSessionManager manager];
        
        //设置json 序列化，将json转化成数组
        _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        [_requestManager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"0.0.0.0" password:@"tuicool"];
        
        //在序列化中追加一个类型。这个类型就是即将要支持的类型
        _requestManager.responseSerializer.acceptableContentTypes = [_requestManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    return _requestManager;
}


@end
