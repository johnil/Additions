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
