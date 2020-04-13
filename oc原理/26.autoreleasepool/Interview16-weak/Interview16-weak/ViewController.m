//
//  ViewController.m
//  Interview16-weak
//
//  Created by MJ Lee on 2018/7/1.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ARC是LLVM编译器和Runtime系统相互协作的一个结果
    
    __strong MJPerson *person1;
    __weak MJPerson *person2;
    __unsafe_unretained MJPerson *person3;
    
    
    NSLog(@"111");
    
    {
        MJPerson *person = [[MJPerson alloc] init];
        
        person3 = person;
    }
    
    NSLog(@"222 - %@", person3);
}


@end
