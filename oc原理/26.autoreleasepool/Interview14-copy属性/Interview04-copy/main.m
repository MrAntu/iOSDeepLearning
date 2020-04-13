//
//  main.m
//  Interview04-copy
//
//  Created by MJ Lee on 2018/6/27.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *p = [[MJPerson alloc] init];
        
//        p.data = [NSMutableArray array];
//        [p.data addObject:@"jack"];
//        [p.data addObject:@"rose"];
        
        [p release];
    }
    return 0;
}
