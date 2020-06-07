//
//  XWCategoryViewCell.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCategoryViewCell.h"
#import "Masonry.h"

@interface XWCategoryViewCell()



@end

@implementation XWCategoryViewCell

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self p_initSubviews];
        [self p_initLayoutSubviews];
    }
    self.transform = CGAffineTransformRotate(self.transform,M_PI/2);
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Private Method
- (void) p_initSubviews{
    [self addSubview:self.tagLabel];
}

- (void) p_initLayoutSubviews{
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(2);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
}

#pragma mark - Setter & Getter
- (UILabel *)tagLabel{
    if(!_tagLabel){
        _tagLabel = [[UILabel alloc]init];
        _tagLabel.font = [UIFont systemFontOfSize:14];
        _tagLabel.numberOfLines = 0;
        _tagLabel.textAlignment = UIStackViewAlignmentCenter;
    }
    return _tagLabel;
}
@end
