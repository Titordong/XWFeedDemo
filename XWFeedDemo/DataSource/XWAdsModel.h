//
//  XWAdsModel.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XWAdsModel : XWBaseModel <NSCopying>

@property (nonatomic, copy) NSString *adsImage;
@property (nonatomic, copy) NSString *adsContent;

@end

NS_ASSUME_NONNULL_END
