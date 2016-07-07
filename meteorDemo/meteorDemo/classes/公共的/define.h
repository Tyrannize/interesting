//
//  define.h
//  WeProject
//
//  Created by 千锋 on 16/6/23.
//  Copyright (c) 2016年 千锋. All rights reserved.
//





#pragma mark ==========文章============
//  id.json ( 文章的id )
#define TK_ARTICLES @"http://0.0.0.0:tuicool@api.tuicool.com/http://api.tuicool.com/api/articles/"


//  评论
//  aid = 文章的id
#define TK_COMMENTS @"http://0.0.0.0:tuicool@api.tuicool.com/http://api.tuicool.com/api/comments/count.json"


//  中英文设置:  lang = 0 中英混合
//              lang = 1 仅中文
//              lang = 2 仅英文


//  lang (语言)
//  size (加载数量)
//  pn (页数)
//  last_id 上一页最后文章的id

//  推荐
#define TK_REC @"http://0.0.0.0:tuicool@api.tuicool.com/api.tuicool.com/api/articles/rec.json"

#define TK_HOT  @"http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json"
//   热门 cid=0
//   科技 cid=101000000
//   创投 cid=101040000
//   数码 cid=101050000
//   技术 cid=20
//   设计 cid=108000000
//   营销 cid=114000000



//  搜索页:

//  文章
//  kw= 搜索栏输入的文字
//  lang （语言设置）
//  size
#define TK_SEARCH_ARTICLES @"http://0.0.0.0:tuicool@api.tuicool.com/api/articles/search.json"

//  主题
//  kw
#define TK_SEARCH_TOPICS  @"http://0.0.0.0:tuicool@api.tuicool.com/api/topics/search.json"

//  站点
//  kw
#define TK_SEARCH_SITES @"http://0.0.0.0:tuicool@api.tuicool.com/api/sites/search.json"

// navigationbar 右按钮

//  推荐设置
#define TK_SETTING @"http://0.0.0.0:tuicool@api.tuicool.com/api/settings/read.json"

//  一周拾遗
#define TK_WEEKLY @"http://0.0.0.0:tuicool@api.tuicool.com/api/weekly/my.json"


#pragma mark  ========站点==========

//  未登录时的站点
#define TK_SITES @"http://api.tuicool.com/api/sites/user_default.json"

//  登录后的站点显示
#define TK_MYSITES @"http://0.0.0.0:tuicool@api.tuicool.com/api/sites/my.json"
//  cid =
//  订阅站点

//  新新推荐    cid=0
//  业界科技    cid=10000000
//  移动互联    cid=10000099
//  手机数码    cid=10000045
//  创业投资    cid=10000024
//  产品设计    cid=10000084
//  营销推广    cid=10450034
//  企业应用    cid=11000133
//  前端开发    cid=11000079
//  移动开发    cid=11000077
//  技术综合    cid=11000060
//  后端技术    cid=11000148
//  C/C++       cid=11010000
//  Java        cid=11000072
//  .Net        cid=11050000
//  PHP         cid=11120000
//  Python      cid=11130000
//  Ruby        cid=11140000
//  编程综合    cid=11000151
//  测试技术    cid=11000084
//  安全技术    cid=11000086
//  信息检索    cid=11000062
//  网络技术    cid=11000115



#pragma mark - ========主题========

//  未登录时的主题
#define TK_TOPICS @"http://0.0.0.0:tuicool@api.tuicool.com/api/topics/user_default.json"

//  登录后的主题显示
#define TK_MYTOPICS @"http://0.0.0.0:tuicool@api.tuicool.com/api/topics/my_all.json"

//  订阅主题
#define TK_TOPICS_ALL @"http://0.0.0.0:tuicool@api.tuicool.com/api/topics/hot_all.json"

#pragma mark - ========周刊============
#define TK_MAG @"http://0.0.0.0:tuicool@api.tuicool.com/api/mag/home.json"

//  周刊列表
#define TK_PERIOD @"http://0.0.0.0:tuicool@api.tuicool.com/api/mag/period_list.json"
//  type = 2  科技周刊
//  type = 3  创业周刊
//  type = 1  设计匠艺
//  type = 0  编程狂人
//  type = 4  Guru Weekly


#pragma mark - ========我的=============
//  个人资料
#define TK_MY_INFO @"http://0.0.0.0:tuicool@api/users/my_info.json"

// 我的待读
//  size = 显示的条数
#define TK_MY_LATE @"http://0.0.0.0:tuicool@api.tuicool.com/api/articles/late.json"

// 我的收藏
//size = 显示的条数
#define TK_MY_COLLECT @"http://api.tuicool.com/api/articles/my.json"
//  我的推刊
#define TK_MY_KAN @"http://0.0.0.0:tuicool@api.tuicool.com/api/kans/my.json"

//  我的通知(列表)
#define TK_NOTIF_LIST @"http://0.0.0.0:tuicool@api.tuicool.com/api/notifications/list.json"

#define TK_NOTIF_TYPE  @"http://0.0.0.0:tuicool@api.tuicool.com/api/notifications/messages.json"
//  type = 1    系统通知
//  type = 5    活动通知
//  type = 3    @我的
//  type = 6    讨论区
