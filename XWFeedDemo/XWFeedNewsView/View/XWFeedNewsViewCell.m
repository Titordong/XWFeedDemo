//
//  XWFeedNewsViewCell.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWFeedNewsViewCell.h"
#import "Masonry.h"
#import "XWFeedModel.h"
#import "BDWebImage.h"

@interface XWFeedNewsViewCell()

@property (nonatomic,strong) UIImageView *thumbnailImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *categoryLabel;
@property (nonatomic,strong) UILabel *authorLabel;

@property (nonatomic,strong) UIImageView *adsImageView;
@property (nonatomic,strong) UILabel *adsContentLabel;

@end

@implementation XWFeedNewsViewCell

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        if([reuseIdentifier compare:@"ads"] == NSOrderedSame){
            [self p_initAds];
            [self p_initLayoutAds];
        }
        else {
            [self p_initSubviews];
            [self p_layoutSubviews];
        }
    }
    return self;
}

#pragma mark - Private Method
- (void) p_initAds{
    [self addSubview:self.adsImageView];
    [self addSubview:self.adsContentLabel];
    self.adsImageView.image = [UIImage imageNamed:@"img_ads.jpg"];
    self.adsContentLabel.text = @"618开业大酬宾，红烧鸡腿免费大放送！！！";
}

- (void) p_initLayoutAds{
    [self.adsImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.adsContentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self.adsImageView.mas_right).offset(10);
        make.right.equalTo(self).offset(-5);
        make.height.mas_equalTo(100);
    }];
}
- (void)p_initSubviews{
    [self addSubview:self.thumbnailImageView];
    [self.thumbnailImageView addSubview:self.titleLabel];
    [self.thumbnailImageView addSubview:self.dateLabel];
    [self addSubview:self.categoryLabel];
    [self addSubview:self.authorLabel];
}

- (void)p_layoutSubviews{
    [self.thumbnailImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(414, 260));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.thumbnailImageView.mas_left).offset(5);
        make.right.equalTo(self.thumbnailImageView.mas_right).offset(-5);
        make.top.equalTo(self).offset(5);
        make.height.mas_equalTo(70);
    }];

    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.thumbnailImageView.mas_bottom).offset(-5);
        make.left.equalTo(self).offset(5);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];

    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-5);
        make.top.equalTo(self.thumbnailImageView.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(150, 20));
    }];

    [self.categoryLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.authorLabel.mas_right).offset(5);
        make.bottom.equalTo(self).offset(-5);
        make.top.equalTo(self.thumbnailImageView.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

    
}

#pragma mark - Setter & Getter
- (void)setNewsData:(XWFeedModel *)newsData{
    _newsData = newsData;
    [_thumbnailImageView bd_setImageWithURL:[NSURL URLWithString:newsData.thumbnail_pic_s]];
    _titleLabel.text = newsData.title;
    _dateLabel.text = newsData.date;
    _categoryLabel.text = newsData.category;
    _authorLabel.text = newsData.author_name;
}

- (UIImageView *)thumbnailImageView{
    if(!_thumbnailImageView){
        _thumbnailImageView = [[UIImageView alloc]init];
    }
    return _thumbnailImageView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.25];
//        _titleLabel.textColor=[UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)dateLabel{
    if(!_dateLabel){
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.25];
//        _dateLabel.textColor=[UIColor whiteColor];
        _dateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _dateLabel;
}

- (UILabel *)categoryLabel{
    if(!_categoryLabel){
        _categoryLabel = [[UILabel alloc]init];
        _categoryLabel.font = [UIFont systemFontOfSize:12];
    }
    return _categoryLabel;
}

- (UILabel *)authorLabel{
    if(!_authorLabel){
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:12];
    }
    return _authorLabel;
}

- (UIImageView *)adsImageView{
    if(!_adsImageView){
        _adsImageView = [[UIImageView alloc]init];
    }
    return _adsImageView;
}

- (UILabel *)adsContentLabel{
    if(!_adsContentLabel){
        _adsContentLabel = [[UILabel alloc]init];
        _adsContentLabel.font = [UIFont systemFontOfSize:16];
        _adsContentLabel.numberOfLines = 0;
    }
    return _adsContentLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
