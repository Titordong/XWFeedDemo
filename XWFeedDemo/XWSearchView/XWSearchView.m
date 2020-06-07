//
//  XWSearchView.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWSearchView.h"
#import "Masonry.h"
@interface XWSearchView ()

@property (nonatomic,strong) UIImageView *searchImage;
@property (nonatomic,strong) UITextField *contentTextField;
@property (nonatomic,assign) CGFloat viewHeight;

@end

@implementation XWSearchView

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_init];
        [self p_initSubviews];
        [self p_initLayoutSubviews];
    }
    return self;
}



#pragma mark - Private Method
- (void) p_init{
    self.viewHeight = 50;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
}

- (void) p_initSubviews{
    [self addSubview:self.searchImage];
    [self addSubview:self.contentTextField];
}

- (void) p_initLayoutSubviews{
    [self.searchImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(5);
        make.size.mas_equalTo(CGSizeMake(_viewHeight-10,_viewHeight - 10));
    }];
    
    [self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-5);
        make.left.equalTo(self.searchImage.mas_right).offset(5);
        make.right.equalTo(self).offset(-5);
    }];
}

#pragma mark - Setter & Getter
- (UIImageView *)searchImage{
    if (!_searchImage){
        _searchImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.viewHeight-10, self.viewHeight-10)];
        _searchImage.image = [UIImage imageNamed:@"img_search.png"];
        _searchImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _searchImage;
}

- (UITextField *)contentTextField{
    if(!_contentTextField){
        _contentTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.viewHeight-10)];
        _contentTextField.placeholder = @"input something";
        _contentTextField.font = [UIFont systemFontOfSize:30];
        _contentTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    }
    return _contentTextField;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
