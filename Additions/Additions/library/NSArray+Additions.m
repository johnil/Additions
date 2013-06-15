//
//  NSArray+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (id)firstObject{
    if (self.count <= 0) {
        return nil;
    }
    return [self objectAtIndex:0];
}

@end
