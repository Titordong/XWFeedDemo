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
#import "XWAdsModel.h"
#import "XWBaseModel.h"
#import "FactoryTableViewCell.h"
#import "FactoryCollectionViewCell.h"
#import "XWAdsCollectionViewCell.h"
#import "XWFeedNewsCollectionViewCell.h"
#import "XWCollectionBaseCell.h"

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

    XWFeedModel *temp = [[XWFeedModel alloc]init];
    temp.uniquekey = @"2d48edd6706e5e0b6b8f513af0e5bf80";
    temp.title = @"全球新冠肺炎COVID-19实时追踪，关注全球疫情动态";
    temp.date = @"2020-06-08 15:56:27";
    temp.category = @"头条";
    temp.author_name = @"健康咨询";
    temp.url = @"https://covid-19.juheapi.com/?s=toutiao";
    temp.thumbnail_pic_s = @"https://juheimgs.oss-cn-beijing.aliyuncs.com/banner/202003/d8376e7e3010cc3f.png";
    XWAdsModel *temp2 = [[XWAdsModel alloc]init];
    temp2.adsImage = @"img_ads.jpg";
    temp2.adsContent = @"618开业大酬宾，红烧鸡腿免费大放送！！！";
    
    /*写死的数据用来测试*/
    
//    for(int i=0;i<15;i++){
//        XWBaseModel *obj;
//        NSInteger index = rand()%5;// 1/5概率插入一条广告
//        if(index < 1){
//            obj = [temp2 copy];
//        }
//        else {
//            obj = [temp copy];
//        }
//        [self.dataArray addObject:obj];
//    }
//    [self.delegate loadDataCompleted];
//    return;
    /*测试数据*/
    
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           [[TTNetworkManager shareInstance] requestForJSONWithURL:self.url params:nil method:@"GET" needCommonParams:NO callback:^(NSError *error, NSDictionary *jsonObj) {
               if ([jsonObj valueForKey:@"error_code"] != 0) {
                   [[[jsonObj valueForKey:@"result"] valueForKey:@"data"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *_Nonnull stop) {
                       NSInteger index = rand()%5;// 1/5概率插入一条广告
                       if(index < 1){
                           [self.dataArray addObject:[temp2 copy]];
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
    XWBaseModel *model = self.dataArray[indexPath.row];
    XWBaseCell *cell = [FactoryTableViewCell createTableViewCellWithModel:model tableView:tableView indexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setDataWithModel:model];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - UICollectionDataSource Method
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XWBaseModel *model = self.dataArray[indexPath.row];
    XWCollectionBaseCell *cell = [FactoryCollectionViewCell createCollectionViewCellWithModel:model collectionView:collectionView indexPath:indexPath];
    [cell setDataWithModel:model];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray count];
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

