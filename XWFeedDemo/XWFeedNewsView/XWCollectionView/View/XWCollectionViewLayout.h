//
//  XWCollectionViewLayout.h
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XWCollectionViewLayout;

@protocol XWWaterFallFlowLayoutDelegate <NSObject>

@required

- (CGFloat)waterFallFlowLayout:(XWCollectionViewLayout *)waterFallFlowLayout heightForItemWidth:(CGFloat)width AtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XWCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) NSUInteger   columnCount;         // 列的数量
@property (nonatomic, assign) CGFloat      columnSpacing;       // 列之间的间距
@property (nonatomic, assign) CGFloat      rowSpacing;          // item之间的行间距
@property (nonatomic, assign) UIEdgeInsets edgeInset;           // item与collectionView边缘的间距
@property (nonatomic, assign) CGSize       footerReferenceSize; // footer的size
@property (nonatomic, weak) id<XWWaterFallFlowLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
