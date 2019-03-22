//
//  ViewController.m
//  DrawRectString
//
//  Created by 袁伟森 on 2019/3/22.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "ViewController.h"
#import "StringView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    StringView *sv = [[StringView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
}

@end
