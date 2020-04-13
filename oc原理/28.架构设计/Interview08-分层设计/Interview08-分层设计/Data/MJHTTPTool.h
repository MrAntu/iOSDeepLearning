//
//  MJHTTPTool.h
//  Interview08-分层设计
//
//  Created by MJ Lee on 2018/7/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJHTTPTool : NSObject
+ (void)GET:(NSString *)URL params:(NSDictionary *)params success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end
