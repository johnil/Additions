//
//  NSDictionary+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (id)objectForKey:(id)key withClass:(Class)class{
    id obj = [self valueForKey:key];
    NSString *str = [NSString stringWithFormat:@"the value is not %@", NSStringFromClass(class)];
    NSAssert(![obj isKindOfClass:class], str);
    if (obj == [NSNull null]) {
        return nil;
    }
    return obj;
}

- (NSString *)stringForKey:(NSString *)key{
    return [self objectForKey:key withClass:[NSString class]];
}

- (NSNumber *)numberForKey:(NSString *)key{
    return [self objectForKey:key withClass:[NSNumber class]];
}

- (int)intForKey:(NSString *)key{
    return [[self numberForKey:key] intValue];
}

- (float)floatForKey:(NSString *)key{
    return [[self numberForKey:key] floatValue];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key{
    return [self objectForKey:key withClass:[NSDictionary class]];
}

- (NSArray *)arrayForKey:(NSString *)key{
    return [self objectForKey:key withClass:[NSArray class]];
}

- (NSMutableDictionary *)mutableDictionaryForKey:(NSString *)key{
    NSDictionary *dict = [self dictionaryForKey:key];
    if (dict) {
        return [NSMutableDictionary dictionaryWithDictionary:dict];
    } else {
        return [NSMutableDictionary dictionary];
    }
}

- (NSMutableArray *)mutableArrayForKey:(NSString *)key{
    NSArray *arr = [self arrayForKey:key];
    if (arr) {
        return [NSMutableArray arrayWithArray:arr];
    } else {
        return [NSMutableArray array];
    }
}

@end
