//
//  SWLeftSlideTransitioningModel.h
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SWLeftSlideTransitioningModel : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *interactiveTransitioningModel;

@end
