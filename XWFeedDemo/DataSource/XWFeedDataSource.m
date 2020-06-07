//
//  XWFeedDataSource.m
//  FeedDemo
//
//  Created by bytedance on 2020/6/7.
//  Copyright © 2020 xingwang dong. All rights reserved.
//

#import "XWFeedDataSource.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "TTNetworkManager.h"
#import "XWFeedNewsContainer.h"
#import "XWFeedNewsViewCell.h"
#import "XWFeedModel.h"

@interface XWFeedDataSource()

@property (nonatomic,copy) NSString *url;

@end

@implementation XWFeedDataSource

#pragma mark - Lift Cycle
- (instancetype)init{
    self = [super init];
    if (self) {
        [self p_init];
    }
    return self;
}

- (void)loadNewsData{
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           [[TTNetworkManager shareInstance] requestForJSONWithURL:self.url params:nil method:@"GET" needCommonParams:NO callback:^(NSError *error, NSDictionary *jsonObj) {
               if ([jsonObj valueForKey:@"error_code"] != 0) {
                   [[[jsonObj valueForKey:@"result"] valueForKey:@"data"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *_Nonnull stop) {
                       NSInteger index = rand()%5;// 1/5概率插入一条广告
                       if(index < 1){
                           [self.dataArray addObject:[NSNull null]];
                       }
                       else {
                           [self.dataArray addObject:[XWFeedModel yy_modelWithDictionary:obj]];
                       }
                   }];
               }
               
               if ([self.delegate respondsToSelector:@selector(loadDataCompleted)]) {
                   [self.delegate loadDataCompleted];
               }
           }];
       });
}

#pragma mark - UITableViewDataSource Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifer = @"mycell";
    static NSString *ads = @"ads";
    NSInteger type = 0;
    if([[self.dataArray objectAtIndex:indexPath.row]class] == [NSNull class]){// 判断是否为广告cell
        type = 1;
    }
    
    XWFeedNewsViewCell *cell=[tableView dequeueReusableCellWithIdentifier:type == 1?ads:indentifer];
    if(!cell){
        cell=[[XWFeedNewsViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:type == 1?ads:indentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(type == 0){
        cell.newsData=self.dataArray[indexPath.row];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - Private Method

- (void) p_init{
    self.dataArray = [NSMutableArray array];
    self.url = @"https://v.juhe.cn/toutiao/index?key=1a7c46b6a1ff043f3a48773a1b2fb57c";;
    
    [TTNetworkManager setLibraryImpl:TTNetworkManagerImplTypeLibChromium];
    [TTNetworkManager shareInstance].ServerConfigHostFirst = @"";
    [[TTNetworkManager shareInstance] start];
}

@end

