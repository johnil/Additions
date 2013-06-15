//
//  UIScreen+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIScreen+Additions.h"

@implementation UIScreen (Additions)

+ (float)screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (float)screenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (BOOL)isRetina{
    return [UIScreen mainScreen].scale==2;
}

@end
