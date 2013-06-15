//
//  AdditionsObserver.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "AdditionsObserver.h"
#import "UIApplication+Additions.h"

static AdditionsObserver *sSharedInstance;

@implementation AdditionsObserver

+ (void)load{
    [self performSelectorOnMainThread:@selector(sharedInstance) withObject:nil waitUntilDone:NO];
}

+ (AdditionsObserver *)sharedInstance{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[AdditionsObserver alloc] init];
    });
    return sSharedInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminate) name:UIApplicationWillResignActiveNotification object:nil];
    }
    return self;
}

- (void)appWillTerminate{
    [[UIApplication sharedApplication] setNotFirstRun];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
