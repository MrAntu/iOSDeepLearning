//
//  ViewController.m
//  Interview04-MVC-Apple
//
//  Created by MJ Lee on 2018/7/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJAppPresenter.h"

@interface ViewController ()
@property (strong, nonatomic) MJAppPresenter *presenter;
//@property (strong, nonatomic) MJOtherPresenter *presenter1;
//@property (strong, nonatomic) MJNewsPresenter *presenter2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.presenter = [[MJAppPresenter alloc] initWithController:self];
}

@end
