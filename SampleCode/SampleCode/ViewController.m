//
//  ViewController.m
//  SampleCode
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectChangeHeight(self.view.frame, 10);
    
    TestDelegate *t = [[TestDelegate alloc] initWithDelegate:self];
    
}

- (float)test1{
    NSLog(@"return test1 value 1");
    return 1;
}

- (void)test{
    NSLog(@"call test");
}

- (id)test2:(float)test2{
    NSLog(@"plus test2 with value 1");
    return @(test2+1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
