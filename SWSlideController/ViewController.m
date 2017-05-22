//
//  ViewController.m
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "ViewController.h"
#import "SWLeftViewController.h"
#import "UIViewController+LeftSlide.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)leftItemClick:(UIBarButtonItem *)sender {
    SWLeftViewController *vc = [SWLeftViewController new];
    vc.leftSlideWidth = [UIScreen mainScreen].bounds.size.width*0.7;
    [self showLeftSlideController:vc];
}



@end
