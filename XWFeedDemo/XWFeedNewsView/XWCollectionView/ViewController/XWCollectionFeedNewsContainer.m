//
//  XWCollectionFeedNewsContainer.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCollectionFeedNewsContainer.h"
#import "XWCollectionViewLayout.h"
#import "XWFeedDataSource.h"
#import "MJRefresh.h"
#import "XWAdsModel.h"
#import "XWFeedModel.h"
#import "XWAdsCollectionViewCell.h"
#import "XWFeedNewsCollectionViewCell.h"

@interface XWCollectionFeedNewsContainer()<XWWaterFallFlowLayoutDelegate,XWNewsDataSourceDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) XWFeedDataSource *dataSource;

@end

@implementation XWCollectionFeedNewsContainer

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_init];
        [self p_initSubviews];
    }
    return self;
}


#pragma mark - SCNewsDataSourceDelegate Method
- (void)loadDataCompleted {
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
}

#pragma mark - XWWaterFallFlowLayoutDelegate Method
- (CGFloat)waterFallFlowLayout:(XWCollectionViewLayout *)waterFallFlowLayout heightForItemWidth:(CGFloat)width AtIndexPath:(NSIndexPath *)indexPath{
    NSString *name = NSStringFromClass([self.dataSource.dataArray[indexPath.row] class]);
    if([name compare:@"XWAdsModel"] == NSOrderedSame){
        return 120;
    }
    else {
         return 150 + ((XWFeedModel *)self.dataSource.dataArray[indexPath.row]).title.length / 10 * 22 + 22;
    }
}

#pragma mark - Load Action Method
- (void)loadNewData {
    // 重新获取列表
    [self.dataSource.dataArray removeAllObjects];
    [self.dataSource loadNewsData];
}

- (void)loadMore {
    // 追加内容到列表
    [self.dataSource loadNewsData];
}

#pragma mark - Private Method
- (void)p_init {
    self.dataSource = [[XWFeedDataSource alloc] init];
    self.dataSource.delegate = self;
    [self.dataSource loadNewsData];
}

- (void)p_initSubviews {
    [self addSubview:self.collectionView];
}

#pragma mark - Setter & Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        XWCollectionViewLayout *myLayout = [[XWCollectionViewLayout alloc] init];
        myLayout.columnCount = 2;
        myLayout.columnSpacing = 10;
        myLayout.rowSpacing = 10;
        myLayout.edgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
        myLayout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:myLayout];
        [_collectionView registerClass:[XWAdsCollectionViewCell class] forCellWithReuseIdentifier:@"XWAdsModel"];
        [_collectionView registerClass:[XWFeedNewsCollectionViewCell class] forCellWithReuseIdentifier:@"XWFeedModel"];
        
        _collectionView.dataSource = self.dataSource;
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
