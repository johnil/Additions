//
//  UIDevice+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIDevice+Additions.h"
#import "OpenUDID.h"
#import <netinet/in.h>
#import <SystemConfiguration/SystemConfiguration.h>

@implementation UIDevice (Additions)

+ (BOOL)isNewiPad{
    return ([self isiPad] && [UIScreen mainScreen].scale==2);
}

+ (BOOL)isiPhone5{
    return [UIScreen mainScreen].bounds.size.height==568.f;
}

+ (BOOL)isiPad{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (NSString *)udid{
    return [OpenUDID value];
}

+ (BOOL)isNetworkReachable{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    BOOL result = (isReachable && !needsConnection);
    return result;
}

@end
