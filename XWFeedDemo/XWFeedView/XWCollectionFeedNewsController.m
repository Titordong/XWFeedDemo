//
//  XWCollectionFeedNewsController.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/8.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWCollectionFeedNewsController.h"
#import "XWCollectionFeedNewsContainer.h"

@interface XWCollectionFeedNewsController ()

@property (nonatomic, strong) XWCollectionFeedNewsContainer *contentView;

@end

@implementation XWCollectionFeedNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_init];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Method
- (void) p_init{
    [self.view addSubview:self.contentView];
}
#pragma mark - Setter & Getter
- (XWCollectionFeedNewsContainer *)contentView{
    if(!_contentView){
        _contentView = [[XWCollectionFeedNewsContainer alloc]initWithFrame:self.view.frame];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
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
