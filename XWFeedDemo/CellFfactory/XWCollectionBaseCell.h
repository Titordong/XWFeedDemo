//
//  XWCollectionBaseCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XWCollectionBaseCell : UICollectionViewCell

- (void)setDataWithModel:(XWBaseModel *)model;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end

NS_ASSUME_NONNULL_END
