//
//  XWFeedModel.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWFeedModel : NSObject

@property (nonatomic,copy) NSString *uniquekey;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *category;
@property (nonatomic,copy) NSString *author_name;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *thumbnail_pic_s;

@end

NS_ASSUME_NONNULL_END
