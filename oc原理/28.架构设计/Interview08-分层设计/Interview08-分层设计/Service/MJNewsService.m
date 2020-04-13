//
//  MJNewsService.m
//  Interview08-分层设计
//
//  Created by MJ Lee on 2018/7/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJNewsService.h"
#import "MJHTTPTool.h"
#import "MJDBTool.h"

@implementation MJNewsService

+ (void)loadNews:(NSDictionary *)params success:(void (^)(NSArray *newsData))success failure:(void (^)(NSError *error))failure
{
    // 先取出本地数据
//    [MJDBTool loadLocalData....];
    
    // 如果没有本地数据，就加载网络数据
//    [MJHTTPTool GET:@"xxxx" params:nil success:^(id result) {
//        success(array);
//    } failure:failure];
}
@end
