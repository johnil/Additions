//
//  NSString+Additions.h
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

#pragma mark - java api
- (int) compareTo: (NSString*) comp;
- (int) compareToIgnoreCase: (NSString*) comp;
- (bool) contains: (NSString*) substring;
- (bool) endsWith: (NSString*) substring;
- (bool) startsWith: (NSString*) substring;
- (int) indexOf: (NSString*) substring;
- (int) indexOf:(NSString *)substring startingFrom: (int) index;
- (int) lastIndexOf: (NSString*) substring;
- (int) lastIndexOf:(NSString *)substring startingFrom: (int) index;
- (NSString*) substringFromIndex:(int)from toIndex: (int) to;
- (NSString*) trim;
- (NSArray*) split: (NSString*) token;
- (NSString*) replace: (NSString*) target withString: (NSString*) replacement;
- (NSArray*) split: (NSString*) token limit: (int) maxResults;


@end
