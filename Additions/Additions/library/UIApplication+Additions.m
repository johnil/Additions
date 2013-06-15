//
//  UIApplication+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIApplication+Additions.h"

@implementation UIApplication (Additions)

- (BOOL)isFirstRun{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"version"]==nil;
}

- (BOOL)isFirstRunCurrentVersion{
    if ([self isFirstRun]) {
        return YES;
    } else {
        return [[NSUserDefaults standardUserDefaults] floatForKey:@"version"] == [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] floatValue];
    }
}

- (void)setFirstRun{
    [[NSUserDefaults standardUserDefaults] setFloat:-1 forKey:@"version"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setNotFirstRun{
    [[NSUserDefaults standardUserDefaults] setFloat:[self version] forKey:@"version"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)version{
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] floatValue];
}

@end
