//
//  main.m
//  Interview16-autorelease
//
//  Created by MJ Lee on 2018/7/2.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool { //  r1 = push()
        
        MJPerson *p1 = [[[MJPerson alloc] init] autorelease];
        MJPerson *p2 = [[[MJPerson alloc] init] autorelease];
        
        @autoreleasepool { // r2 = push()
            for (int i = 0; i < 600; i++) {
                MJPerson *p3 = [[[MJPerson alloc] init] autorelease];
            }
            
            @autoreleasepool { // r3 = push()
                MJPerson *p4 = [[[MJPerson alloc] init] autorelease];
                
                _objc_autoreleasePoolPrint();
            } // pop(r3)
            
        } // pop(r2)
        
        
    } // pop(r1)
    
    
    return 0;
}

void test()
{
    //        atautoreleasepoolobj = objc_autoreleasePoolPush();
    // atautoreleasepoolobj = 0x1038
    
    for (int i = 0; i < 1000; i++) {
        MJPerson *person = [[[MJPerson alloc] init] autorelease];
    } // 8000个字节
    
    //        objc_autoreleasePoolPop(0x1038);
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
