//
//  FactoryCollectionViewCell.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XWCollectionBaseCell;
@class XWBaseModel;

@interface FactoryCollectionViewCell : NSObject

+ (XWCollectionBaseCell *) createCollectionViewCellWithModel:(XWBaseModel *)model collectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
