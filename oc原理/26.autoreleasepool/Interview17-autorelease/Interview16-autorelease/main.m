//
//  main.m
//  Interview16-autorelease
//
//  Created by MJ Lee on 2018/7/2.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        atautoreleasepoolobj = objc_autoreleasePoolPush();
        
        for (int i = 0; i < 1000; i++) {
            MJPerson *person = [[[MJPerson alloc] init] autorelease];
        } // 8000个字节
        
//        objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
    return 0;
}

/*
 
 struct __AtAutoreleasePool {
    __AtAutoreleasePool() { // 构造函数，在创建结构体的时候调用
        atautoreleasepoolobj = objc_autoreleasePoolPush();
    }
 
    ~__AtAutoreleasePool() { // 析构函数，在结构体销毁的时候调用
        objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
 
    void * atautoreleasepoolobj;
 };
 
 {
    __AtAutoreleasePool __autoreleasepool;
    MJPerson *person = ((MJPerson *(*)(id, SEL))(void *)objc_msgSend)((id)((MJPerson *(*)(id, SEL))(void *)objc_msgSend)((id)((MJPerson *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("MJPerson"), sel_registerName("alloc")), sel_registerName("init")), sel_registerName("autorelease"));
 }
 
 
    atautoreleasepoolobj = objc_autoreleasePoolPush();
 
    MJPerson *person = [[[MJPerson alloc] init] autorelease];
 
    objc_autoreleasePoolPop(atautoreleasepoolobj);
 */
