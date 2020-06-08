//
//  XWAdsCollectionViewCell.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWAdsCollectionViewCell.h"
#import "Masonry.h"
#import "XWAdsModel.h"
#import "BDWebImage.h"

@interface XWAdsCollectionViewCell()

@property (nonatomic,strong) UIImageView *adsImageView;
@property (nonatomic,strong) UILabel *adsContentLabel;

@end

@implementation XWAdsCollectionViewCell

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self p_initSubviews];
        [self p_initLayoutSubviews];
    }
    return self;
}

#pragma mark - Override Method
- (void)setDataWithModel:(XWBaseModel *)model{
    self.newsData = (XWAdsModel *)model;
}

#pragma mark - Private Method
- (void) p_initSubviews{
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [self addSubview:self.adsImageView];
    [self addSubview:self.adsContentLabel];
}

- (void) p_initLayoutSubviews{
    [self.adsImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-5);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.adsContentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self.adsImageView.mas_right).offset(10);
        make.right.equalTo(self).offset(-5);
        make.height.mas_equalTo(100);
    }];
}

#pragma mark - Setter & Getter
- (void)setNewsData:(XWAdsModel *)newsData{
    self.adsImageView.image = [UIImage imageNamed:newsData.adsImage];
    self.adsContentLabel.text = newsData.adsContent;
}

- (UIImageView *)adsImageView{
    if(!_adsImageView){
        _adsImageView = [[UIImageView alloc]init];
        _adsImageView.layer.cornerRadius = 5;
        _adsImageView.clipsToBounds = YES;
    }
    return _adsImageView;
}

- (UILabel *)adsContentLabel{
    if(!_adsContentLabel){
        _adsContentLabel = [[UILabel alloc]init];
        _adsContentLabel.font = [UIFont systemFontOfSize:15];
        _adsContentLabel.numberOfLines = 0;
    }
    return _adsContentLabel;
}


@end
