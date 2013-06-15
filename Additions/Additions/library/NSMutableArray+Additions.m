//
//  NSMutableArray+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (Additions)

- (void)removeFirstObject{
    if (self.count>0) {
        [self removeObjectAtIndex:0];
    }
}

@end
