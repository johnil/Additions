//
//  TestDelegate.h
//  SampleCode
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegate <NSObject>

- (void)test;
- (float)test1;
- (id)test2:(float)test2;

@end

@interface TestDelegate : NSObject

- (id)initWithDelegate:(id)delegate;

@property (nonatomic, strong) id delegate;

@end
