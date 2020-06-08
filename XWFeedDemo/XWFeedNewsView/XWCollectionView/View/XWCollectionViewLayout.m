//
//  XWCollectionViewLayout.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCollectionViewLayout.h"

@interface XWCollectionViewLayout()

@property (nonatomic, strong) NSMutableArray *columnHeights;
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation XWCollectionViewLayout

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        self.columnHeights = [NSMutableArray array];
        self.attrsArray = [NSMutableArray array];
        self.columnCount = 2;
        self.edgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.collectionView.backgroundColor = [UIColor yellowColor];
    }

    return self;
}

#pragma mark - override
- (void)prepareLayout {
    [super prepareLayout];

    // 清理上次布局的列高和attributes
    [self.columnHeights removeAllObjects];
    [self.attrsArray removeAllObjects];

    // 初始化列高
    for (int i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInset.top)];
    }

    // 初始化attributes
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attr];
    }

    // 添加footerView
    UICollectionViewLayoutAttributes *footerAttr = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathWithIndex:0]];
    footerAttr.frame = CGRectMake(0, [self collectionViewContentSize].height - self.footerReferenceSize.height, self.footerReferenceSize.width, self.footerReferenceSize.height);
    [self.attrsArray addObject:footerAttr];
}

- (CGSize)collectionViewContentSize {
    // 获取最长列
    CGFloat res = 0;
    for (int i = 0; i < self.columnCount; i++) {
        CGFloat height = [self.columnHeights[i] doubleValue];
        if (height > res) {
            res = height;
        }
    }

    return CGSizeMake(0, res + self.edgeInset.bottom + self.footerReferenceSize.height);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return [self.attrsArray copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemX, itemY, itemWidth, itemHeight;

    // 列宽 = （collectionView宽度 - 左右宽度 - 列间距） / 列数
    itemWidth = (CGRectGetWidth(self.collectionView.frame) - self.edgeInset.left - self.edgeInset.right - (self.columnCount - 1) * self.columnSpacing) / self.columnCount;
    itemHeight = [self.delegate waterFallFlowLayout:self heightForItemWidth:itemWidth AtIndexPath:indexPath];

    // 寻找最短列，将新item排布在其下
    NSInteger shortestI = 0;
    CGFloat shortestHeight = [self.columnHeights[0] doubleValue];
    for (int i = 0; i < self.columnCount; i++) {
        CGFloat height = [self.columnHeights[i] doubleValue];
        if (height < shortestHeight) {
            shortestHeight = height;
            shortestI = i;
        }
    }
    itemX = self.edgeInset.left + (itemWidth + self.columnSpacing) * shortestI;
    itemY = shortestHeight;

    self.columnHeights[shortestI] = @(itemY + itemHeight + self.rowSpacing);

    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 使用计算出的frame更新attribute
    attr.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);

    return attr;
}
@end
