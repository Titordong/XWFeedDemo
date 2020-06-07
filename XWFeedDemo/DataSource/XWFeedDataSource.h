//
//  XWFeedDataSource.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XWNewsDataSourceDelegate <NSObject>

@required

- (void)loadDataCompleted;

@end

@interface XWFeedDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,weak)id<XWNewsDataSourceDelegate>delegate;

- (void) loadNewsData;


@end

NS_ASSUME_NONNULL_END
