//
//  TestDelegate.m
//  SampleCode
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "TestDelegate.h"

@implementation TestDelegate

- (id)initWithDelegate:(id)delegate_{
    self = [super init];
    if (self) {
        _delegate = delegate_;
        [_delegate test];
        float test1 = [_delegate test1];
        float test2 = [[_delegate test2:23] floatValue];
        NSLog(@"%f %f", test1, test2);
    }
    return self;
}

@end
