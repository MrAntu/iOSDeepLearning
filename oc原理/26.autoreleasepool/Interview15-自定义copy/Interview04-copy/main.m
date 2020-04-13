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
        MJPerson *p1 = [[MJPerson alloc] init];
        p1.age = 20;
        p1.weight = 50;

        MJPerson *p2 = [p1 copy];
//        p2.age = 30;

        NSLog(@"%@", p1);
        NSLog(@"%@", p2);

        [p2 release];
        [p1 release];
        
        //        NSString *str;
        //        [str copy];
        //        [str mutableCopy];
        
        //        NSArray, NSMutableArray;
        //        NSDictionary, NSMutableDictionary;
        //        NSString, NSMutableString;
        //        NSData, NSMutableData;
        //        NSSet, NSMutableSet;
    }
    return 0;
}
