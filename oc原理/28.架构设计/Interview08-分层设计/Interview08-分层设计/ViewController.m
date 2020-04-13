//
//  ViewController.m
//  Interview08-分层设计
//
//  Created by MJ Lee on 2018/7/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJNewsService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MJNewsService loadNews:@{} success:^(NSArray *newsData) {
        
    } failure:^(NSError *error) {
        
    }];
}


@end
