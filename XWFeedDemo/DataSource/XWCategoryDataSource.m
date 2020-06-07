//
//  XWCategoryDatasource.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCategoryDataSource.h"
#import "XWCategoryViewCell.h"

@interface XWCategoryDataSource()

@end

@implementation XWCategoryDataSource

#pragma mark - Life Cycle
- (instancetype)init{
    self=[super init];
    if(self){
        [self p_init];
    }
    return self;
}

#pragma mark - TableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XWCategoryViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(!cell){
        cell=[[XWCategoryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    cell.tagLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

#pragma mark - Private Method
- (void) p_init{
    self.dataArray=@[@"标签1",@"标签2",@"标签3",@"标签4",@"标签5",@"标签6",@"标签7",@"标签8",@"标签9",@"标签10",@"标签11",@"标签12"];
}
@end
