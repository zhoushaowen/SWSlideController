//
//  SWLeftViewController.m
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWLeftViewController.h"

@interface SWLeftViewController ()<UINavigationControllerDelegate>

@end

@implementation SWLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}


@end
