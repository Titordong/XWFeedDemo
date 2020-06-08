# XWFeedDemo
### 简介

简单实现UITableView的一个小demo,Github的图片预览有Bug，还未解决

### 配置pod

下载后使用命令 pod install 安装依赖，重启打开.wcworkspace项目

### 运行

- 测试使用虚拟机为iPhone 11，使用其他虚拟机布局可能会乱

- 从网络获取新闻内容并显示，又1/5概率刷到广告

- 效果图如下

  <img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gfjwju38mhj30la18q7wh.jpg" alt="image-20200607182930849"  />

  

刷到广告

<img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gfjwkl52b9j30la18qe81.jpg" alt="image-20200607183013978"  />

- 支持下拉刷新和上拉加载更多
- 获取新闻的API每天上限100次，运行即崩溃可能是因为次数用完
