//
//  UIDevice+Additions.h
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Additions)

+ (BOOL)isNewiPad;
+ (BOOL)isiPhone5;
+ (BOOL)isiPad;
+ (NSString *)udid;
+ (BOOL)isNetworkReachable;

@end
