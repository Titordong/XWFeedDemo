//
//  XWBaseCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XWBaseCell : UITableViewCell

- (void)setDataWithModel:(XWBaseModel *)model;
- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
