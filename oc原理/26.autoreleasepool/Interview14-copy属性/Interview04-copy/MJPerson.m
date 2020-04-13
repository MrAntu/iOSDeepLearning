//
//  MJPerson.m
//  Interview04-copy
//
//  Created by MJ Lee on 2018/6/28.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

@implementation MJPerson

//- (void)setData:(NSArray *)data
//{
//    if (_data != data) {
//        [_data release];
//        _data = [data copy];
//    }
//}

- (void)dealloc
{
    self.data = nil;
    
    [super dealloc];
}

@end
