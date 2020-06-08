//
//  FactoryCollectionViewCell.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "FactoryCollectionViewCell.h"
#import "XWBaseModel.h"
#import "XWCollectionBaseCell.h"

@implementation FactoryCollectionViewCell

+ (XWCollectionBaseCell *)createCollectionViewCellWithModel:(XWBaseModel *)model collectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{
    NSString *name=NSStringFromClass([model class]);
    XWCollectionBaseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:name forIndexPath:indexPath];
    return cell;
}

@end
