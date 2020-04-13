//
//  main.m
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

void (^block)(void);

void test()
{
    int age = 10;
    static int height = 10;
    
    block = ^{
        // age的值捕获进来（capture）
        NSLog(@"age is %d, height is %d", age, height);
    };
    
    age = 20;
    height = 20;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
        block();
        
        
        // auto：自动变量，离开作用域就销毁
//        auto int age = 10;
//        static int height = 10;
//
//        void (^block)(void) = ^{
//            // age的值捕获进来（capture）
//            NSLog(@"age is %d, height is %d", age, height);
//        };
//
//        age = 20;
//        height = 20;
//
//        block();
//
        
//        void (^block)(int, int) = ^(int a, int b){
//            NSLog(@"Hello, World! - %d %d", a, b);
//        };
//
//        block(10, 20);
        
    
    // main0.cpp
//        void (^block)(void) = ^{
//            NSLog(@"Hello, World!");
//        };
//
//        block();
    }
    return 0;
}
