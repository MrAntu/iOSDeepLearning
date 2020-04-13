//
//  main.m
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int age_ = 10;
static int height_ = 10;

void (^block)(void);

void test()
{
    auto int a = 10;
    static int b = 10;
    block = ^{
        NSLog(@"age is %d, height is %d", a, b);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
        block();
        
//        void (^block)(void) = ^{
//            NSLog(@"age is %d, height is %d", age_, height_);
//        };
//
//        age_ = 20;
//        height_ = 20;
//
//        block();
    }
    return 0;
}
