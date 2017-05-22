//
//  UIViewController+LeftSlide.h
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWLeftSlideTransitioningModel.h"

@interface UIViewController (LeftSlide)

@property (nonatomic,strong) SWLeftSlideTransitioningModel *leftSlideTransitioningModel;
@property (nonatomic) CGFloat leftSlideWidth;

/**
 从哪个界面弹出侧滑界面

 @param leftSlideController 侧滑页面
 */
- (void)showLeftSlideController:(UIViewController *)leftSlideController;

@end
