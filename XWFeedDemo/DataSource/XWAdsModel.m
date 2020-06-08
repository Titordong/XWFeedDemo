//
//  XWAdsModel.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWAdsModel.h"

@implementation XWAdsModel

- (id)copyWithZone:(NSZone *)zone{
    XWAdsModel *md = [[[self class]allocWithZone:zone]init];
    md.adsImage = self.adsImage;
    md.adsContent = self.adsContent;
    return md;
}

@end
