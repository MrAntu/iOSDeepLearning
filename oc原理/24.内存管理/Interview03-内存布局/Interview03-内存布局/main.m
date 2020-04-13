//
//  main.m
//  Interview03-内存布局
//
//  Created by MJ Lee on 2018/6/21.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int a = 10;
int b;

int main(int argc, char * argv[]) {
    @autoreleasepool {
        static int c = 20;
        
        static int d;
        
        int e;
        int f = 20;

        NSString *str = @"123";
        
        NSObject *obj = [[NSObject alloc] init];
        
        NSLog(@"\n&a=%p\n&b=%p\n&c=%p\n&d=%p\n&e=%p\n&f=%p\nstr=%p\nobj=%p\n",
              &a, &b, &c, &d, &e, &f, str, obj);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
 字符串常量
 str=0x10dfa0068
 
 已初始化的全局变量、静态变量
 &a =0x10dfa0db8
 &c =0x10dfa0dbc
 
 未初始化的全局变量、静态变量
 &d =0x10dfa0e80
 &b =0x10dfa0e84
 
 堆
 obj=0x608000012210
 
 栈
 &f =0x7ffee1c60fe0
 &e =0x7ffee1c60fe4
 */
