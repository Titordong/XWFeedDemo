//
//  XWFeedViewController.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/5.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWFeedViewController.h"
#import "XWSearchView.h"
#import "XWCategoryContainer.h"
#import "XWFeedNewsContainer.h"

@interface XWFeedViewController ()

@property (nonatomic,strong) XWSearchView *searchView;
@property (nonatomic,strong) XWCategoryContainer *categoryView;
@property (nonatomic,strong) XWFeedNewsContainer *feedView;

@end

@implementation XWFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_init];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Method
- (void) p_init{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.feedView];
}

#pragma mark - Setter & Getter
- (XWSearchView *)searchView{
    if(!_searchView){
         _searchView = [[XWSearchView alloc]initWithFrame:CGRectMake(5, 40, self.view.frame.size.width-10, 50)];
    }
    return _searchView;
}

- (XWCategoryContainer *)categoryView{
    if(!_categoryView){
        _categoryView = [[XWCategoryContainer alloc]initWithFrame:CGRectMake(90, 0,25 ,self.view.frame.size.width-10)];

    }
    return _categoryView;
}

- (XWFeedNewsContainer *)feedView{
    if(!_feedView){
        _feedView = [[XWFeedNewsContainer alloc]initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _feedView;
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
