//
//  XWFeedNewsContainer.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWFeedNewsContainer.h"
#import "XWFeedDataSource.h"
#import "XWFeedNewsViewCell.h"
#import "XWFeedModel.h"
#import "MJRefresh.h"

@interface XWFeedNewsContainer()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) XWFeedDataSource *dataSource;

@end

@implementation XWFeedNewsContainer

#pragma mark - Life Cycle

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_init];
        [self p_initSubviews];
    }
    return self;
}

#pragma mark - Load Action Method
- (void) loadNewData{
    [self.dataSource.dataArray removeAllObjects];
    [self.dataSource loadNewsData];
}

- (void) loadMore{
    [self.dataSource loadNewsData];
}

#pragma mark - XWNewsDataSourceDelegate Method
- (void) loadDataCompleted{
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


#pragma mark - Private Method
- (void) p_init{
    self.dataSource = [[XWFeedDataSource alloc]init];
    self.dataSource.delegate = self;
    [self.dataSource loadNewsData];
}

- (void) p_initSubviews{
    [self addSubview:self.tableView];
}

#pragma mark - Setter & Getter
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.frame];
        _tableView.dataSource = self.dataSource;
//        _tableView.rowHeight=300;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
    return _tableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
