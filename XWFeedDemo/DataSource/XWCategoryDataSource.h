//
//  XWCategoryDatasource.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWCategoryDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
