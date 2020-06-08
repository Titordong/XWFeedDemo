//
//  XWAdsCollectionViewCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCollectionBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class XWAdsModel;

@interface XWAdsCollectionViewCell : XWCollectionBaseCell

@property (nonatomic, strong) XWAdsModel *newsData;

@end

NS_ASSUME_NONNULL_END
