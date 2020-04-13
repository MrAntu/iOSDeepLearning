//
//  main.m
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 一切以运行时的结果为准
 
 clang c++

 
 llvm x.0 中间文件
 */

int age = 20;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 10;
        
        // 堆：动态分配内存,需要程序员申请申请，也需要程序员自己管理内存
        void (^block1)(void) = ^{
            NSLog(@"Hello");
        };
        
        int age = 10;
        void (^block2)(void) = ^{
            NSLog(@"Hello - %d", age);
        };
        
        NSLog(@"%@ %@ %@", [block1 class], [block2 class], [^{
            NSLog(@"%d", age);
        } class]);
    }
    return 0;
}

void test()
{
    // __NSGlobalBlock__ : __NSGlobalBlock : NSBlock : NSObject
    void (^block)(void) = ^{
        NSLog(@"Hello");
    };
    
    NSLog(@"%@", [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    NSLog(@"%@", [[[[block class] superclass] superclass] superclass]);
}
