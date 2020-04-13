//
//  ViewController.m
//  Interview01-耗电优化
//
//  Created by MJ Lee on 2018/7/5.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationManager *mgr;
    
    // 快速定位
    [mgr requestLocation];
    
    mgr.pausesLocationUpdatesAutomatically = YES;
}


@end
