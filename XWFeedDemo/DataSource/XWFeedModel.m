//
//  XWFeedModel.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWFeedModel.h"

@implementation XWFeedModel

- (id)copyWithZone:(NSZone *)zone{
    XWFeedModel *md = [[[self class]allocWithZone:zone]init];
    md.uniquekey = self.uniquekey;
    md.author_name = self.author_name;
    md.category = self.category;
    md.date = self.date;
    md.thumbnail_pic_s = self.thumbnail_pic_s;
    md.title = self.title;
    md.url = self.url;
    return md;
}
@end
