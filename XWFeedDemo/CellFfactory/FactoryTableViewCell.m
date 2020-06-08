//
//  FactoryTableViewCell.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "FactoryTableViewCell.h"
#import "XWBaseCell.h"
#import "XWBaseModel.h"

@implementation FactoryTableViewCell

+ (XWBaseCell *) createTableViewCellWithModel:(XWBaseModel *)model tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    NSString *name=NSStringFromClass([model class]); //根据类名造cell
    XWBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:name forIndexPath:indexPath];
    if(!cell){
        cell = [[XWBaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name];
    }
    return cell;
}

@end
