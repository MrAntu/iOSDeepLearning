//
//  ViewController.m
//  Interview05-TaggedPointer面试题
//
//  Created by MJ Lee on 2018/6/21.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSString *name;
@end

@implementation ViewController

//- (void)setName:(NSString *)name
//{
//    if (_name != name) {
//        [_name release];
//        _name = [name retain];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            // 加锁
//            self.name = [NSString stringWithFormat:@"abcdefghijk"];
//            // 解锁
//        });
//    }
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            self.name = [NSString stringWithFormat:@"abc"];
//        });
//    }
    
//    NSString *str1 = [NSString stringWithFormat:@"abcdefghijk"];
    NSString *str2 = [NSString stringWithFormat:@"123abc"];
    
//    NSLog(@"%@ %@", [str1 class], [str2 class]);
    NSLog(@"%p", str2);
}


@end
