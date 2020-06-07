//
//  XWCategoryContainer.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCategoryContainer.h"
#import "XWCategoryViewCell.h"
#import "XWCategoryDataSource.h"
#import "Masonry.h"


@interface XWCategoryContainer ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XWCategoryDataSource *dataSource;

@end

@implementation XWCategoryContainer

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self p_init];
        [self p_initLayoutSubviews];
    }
    self.transform = CGAffineTransformMakeRotation(-M_PI/2);
    self.transform = CGAffineTransformTranslate(self.transform,88,100);//旋转90度并且平移到合适位置，还没有搞清楚平移距离和屏幕长宽的数值关系
    return self;
}

#pragma mark - Private Method
- (void) p_init{
    self.backgroundColor = [UIColor yellowColor];
    self.dataSource = [[XWCategoryDataSource alloc]init];
    [self addSubview:self.tableView];
}

- (void) p_initLayoutSubviews{
    
}
#pragma mark - Setter & Getter
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.bounds];
        _tableView.dataSource = self.dataSource;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
