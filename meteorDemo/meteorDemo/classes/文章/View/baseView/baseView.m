//
//  baseView.m
//  WeProject
//
//  Created by 千锋 on 16/6/27.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "baseView.h"
#import "articleModel.h"
#import "articleTableViewCell.h"
#import "LXArticalViewController.h"

@interface baseView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;
@end


@implementation baseView
-(void)awakeFromNib
{
    
    
    [self resquestDataWithCid:self.cid];
    

}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}


- (void)layoutSubviews
{
    
    
    self.backgroundColor = [UIColor whiteColor];
    _TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    
    
    [self addSubview:_TableView];
    
    _TableView.delegate =self;
    _TableView.dataSource = self;
    
    
    _TableView.rowHeight = 100;
    
    //2
    
    [self.TableView registerNib:[UINib nibWithNibName: @"articleTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
    [self requestManager];
    
    //添加刷新
    [self addMJRefresh];
    
    [_TableView.mj_header beginRefreshing];
    

}



#pragma mark 添加刷新
- (void) addMJRefresh {
    
    self.TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self resquestDataWithCid:self.cid];
    }];
    
    self.TableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self resquestDataWithCid:self.cid];
    }];
    
}

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


#pragma mark 数据请求
-(void)resquestDataWithCid:(NSNumber *)cid;
{
    NSDictionary *dic = @{@"cid":cid};
    //使用AFnetworking
    [self.requestManager GET:self.requestURL parameters:dic success:^(NSURLSessionDataTask *task, id responseObject)
     {
         
         NSArray *modelArray = [NSArray yy_modelArrayWithClass:[articleModel class] json:responseObject[@"articles"]];
         
         
         if ([self.TableView.mj_header isRefreshing]) {
             [self.dataArray removeAllObjects];
         }
         
         //将模型放在数据源数组中
         [self.dataArray addObjectsFromArray:modelArray];
         
         
         [self.TableView reloadData];
         [self.TableView.mj_header endRefreshing];
         [self.TableView.mj_footer endRefreshing];
         
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"第二界面请求失败");
     }];

}

//cell 的代理方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    articleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    articleModel *model = [[articleModel alloc]init];
    model = self.dataArray[indexPath.row];
    [self.delegate jumpToDetailWithIDs:model.ids];
}



-(void)buttonClick:(UIButton *)button
{
    printf("按钮点击\n");
}




@end
