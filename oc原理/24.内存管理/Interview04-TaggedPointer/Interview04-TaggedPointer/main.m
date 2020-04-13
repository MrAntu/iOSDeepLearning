//
//  main.m
//  Interview04-TaggedPointer
//
//  Created by MJ Lee on 2018/6/21.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isTaggedPointer(id pointer)
{
    return (long)(__bridge void *)pointer & 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSNumber *number = [NSNumber numberWithInt:10];
//        NSNumber *number = @(10);
        
        NSNumber *number1 = @4;
        NSNumber *number2 = @5;
        NSNumber *number3 = @(0xFFFFFFFFFFFFFFF);
        
        number1.intValue;
        
//        NSLog(@"%d %d %d", isTaggedPointer(number1), isTaggedPointer(number2), isTaggedPointer(number3));
        NSLog(@"%p %p %p", number1, number2, number3);
    }
    return 0;
}
