//
//  settingViewController.m
//  meteorDemo
//
//  Created by liuxing on 16/7/5.
//  Copyright © 2016年 liuxing. All rights reserved.
//

#import "settingViewController.h"
#import "SDImageCache.h"


@interface settingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation settingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatTableView];
}

//创建tableview
- (void)creatTableView {
    
    UITableView *tabView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tabView.delegate = self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iden];
    }
    NSArray *title = @[@[@"开启推送通知",@"开启流量提醒",@"清理缓存"],@[@"官方反馈",@"官方邮箱",@"官方微博"]];
    cell.textLabel.text = title[indexPath.section][indexPath.row];
    UISwitch *LXSwitch = [[UISwitch alloc] init];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.accessoryView = LXSwitch;
    }else if(indexPath.section == 0 && indexPath.row == 1) {
        cell.accessoryView = LXSwitch;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //清除缓存
    if (indexPath.section == 0 && indexPath.row == 2) {
        [self clearWebCache];
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        NSString *str1 = @"通用设置";
        return str1;
    }else {
        NSString *str2 = @"官方信息";
        return str2;
    }
}

//清除缓存
- (void)clearWebCache
{
    //缓存的文件个数
    NSUInteger diskCount = [SDImageCache sharedImageCache].getDiskCount;
    //获取缓存的大小
    NSUInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
    
    NSString * msg = [NSString stringWithFormat:@"缓存文件数量:%lu,缓存文件大小:%.2fM",diskCount,cacheSize/1024.0/1024.0];
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"清除缓存" message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    //添加action
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:cancel];
    //清除action
    UIAlertAction * clearAction = [UIAlertAction actionWithTitle:@"清除缓存" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[SDImageCache sharedImageCache] clearMemory];
        [[SDImageCache sharedImageCache] clearDisk];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"清除成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }];
    [alertController addAction:clearAction];
    
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
