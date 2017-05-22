//
//  UIViewController+LeftSlide.m
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "UIViewController+LeftSlide.h"
#import <objc/runtime.h>

static char LeftSlideTransitioningModel;
static char LeftSlideWidth;

@implementation UIViewController (LeftSlide)

- (void)setLeftSlideTransitioningModel:(SWLeftSlideTransitioningModel *)leftSlideTransitioningModel
{
    objc_setAssociatedObject(self, &LeftSlideTransitioningModel, leftSlideTransitioningModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SWLeftSlideTransitioningModel *)leftSlideTransitioningModel
{
    return objc_getAssociatedObject(self, &LeftSlideTransitioningModel);
}

- (void)setLeftSlideWidth:(CGFloat)leftSlideWidth
{
    objc_setAssociatedObject(self, &LeftSlideWidth, @(leftSlideWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)leftSlideWidth
{
    return [objc_getAssociatedObject(self, &LeftSlideWidth) doubleValue];
}

- (void)showLeftSlideController:(UIViewController *)leftSlideController {
    leftSlideController.modalPresentationStyle = UIModalPresentationCustom;
    self.leftSlideTransitioningModel = [SWLeftSlideTransitioningModel new];
    leftSlideController.transitioningDelegate = self.leftSlideTransitioningModel;
    [self presentViewController:leftSlideController animated:YES completion:nil];
}

@end
