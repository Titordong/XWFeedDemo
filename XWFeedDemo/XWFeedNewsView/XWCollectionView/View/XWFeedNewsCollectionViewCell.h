//
//  XWFeedNewsCollectionViewCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCollectionBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class XWFeedModel;

@interface XWFeedNewsCollectionViewCell : XWCollectionBaseCell

@property (nonatomic,strong) XWFeedModel *newsData;

@end

NS_ASSUME_NONNULL_END
