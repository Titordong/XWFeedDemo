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

@end

@implementation XWFeedNewsViewCell

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self p_initSubviews];
        [self p_layoutSubviews];
    }
    return self;
}

#pragma mark - Override Method
- (void)setDataWithModel:(XWBaseModel *)model{
    self.newsData = (XWFeedModel *) model;
}

#pragma mark - Private Method
- (void)p_initSubviews{
    self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
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
        make.size.mas_equalTo(CGSizeMake(414, 287));
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
        _titleLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        _titleLabel.layer.cornerRadius = 5;
        _titleLabel.clipsToBounds = YES;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)dateLabel{
    if(!_dateLabel){
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        _dateLabel.layer.cornerRadius = 2;
        _dateLabel.clipsToBounds = YES;
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
