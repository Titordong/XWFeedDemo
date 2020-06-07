//
//  XWFeedNewsViewCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XWFeedModel;

@interface XWFeedNewsViewCell : UITableViewCell

@property (nonatomic, strong) XWFeedModel *newsData;

@end

NS_ASSUME_NONNULL_END
