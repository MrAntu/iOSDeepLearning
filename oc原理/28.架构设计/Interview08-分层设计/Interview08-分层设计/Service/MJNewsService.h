//
//  MJNewsService.h
//  Interview08-分层设计
//
//  Created by MJ Lee on 2018/7/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJNewsService : NSObject
+ (void)loadNews:(NSDictionary *)params success:(void (^)(NSArray *newsData))success failure:(void (^)(NSError *error))failure;
@end
