//
//  AdditionsMacro.h
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)//如果为测试模式,则log信息,否则什么都不做. 当项目设置为release时自动修改,不需要额外修改配置
#else
#define NSLog(...) do{} while(0)
#endif

#define imageNamed(name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]])

#define CGRectChangeX(rect, x) (CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height))
#define CGRectChangeY(rect, y) (CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height))
#define CGRectChangeWidth(rect, width) (CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height))
#define CGRectChangeHeight(rect, height) (CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height))
#define CGRectChangeSize(rect, size) (CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height))
#define CGRectChangeOrigin(rect, origin) (CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height))

#import "AudioManager.h"
#import "NSData+Additions.h"
#import "NSString+Additions.h"
#import "NSArray+Additions.h"
#import "NSMutableArray+Additions.h"
#import "NSDictionary+Additions.h"
#import "UIApplication+Additions.h"
#import "UIDevice+Additions.h"
#import "UIScreen+Additions.h"
#import "UITableView+Additions.h"
#import "UIView+Additions.h"
#import "UIColor+Additions.h"