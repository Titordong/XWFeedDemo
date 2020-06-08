//
//  FactoryTableViewCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XWBaseModel;
@class XWBaseCell;

NS_ASSUME_NONNULL_BEGIN

@interface FactoryTableViewCell : NSObject

+ (XWBaseCell *) createTableViewCellWithModel:(XWBaseModel *)model tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
