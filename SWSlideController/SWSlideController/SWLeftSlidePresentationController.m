//
//  SWLeftSlidePresentationController.m
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWLeftSlidePresentationController.h"
#import "SWLeftSlideTransitioningModel.h"
#import "UIViewController+LeftSlide.h"

@interface SWLeftSlidePresentationController ()<UIGestureRecognizerDelegate>
{
    __weak SWLeftSlideTransitioningModel *_transitioningModel;
    CGPoint _startPoint;
    BOOL _isDismiss;
    CGFloat _progress;
}
@end

@implementation SWLeftSlidePresentationController

- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    self.presentedView.frame = CGRectMake(0, 0, self.presentedViewController.leftSlideWidth, [UIScreen mainScreen].bounds.size.height);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tap.delegate = self;
    [self.containerView addGestureRecognizer:tap];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.containerView addGestureRecognizer:pan];
    [tap requireGestureRecognizerToFail:pan];
    _transitioningModel = (SWLeftSlideTransitioningModel *)self.presentedViewController.transitioningDelegate;
}

- (void)tapGesture:(UITapGestureRecognizer *)gesture {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            _startPoint = [gesture translationInView:gesture.view];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentPoint = [gesture translationInView:gesture.view];
            _progress = (_startPoint.x - currentPoint.x)/self.presentedView.frame.size.width;
            if(_progress<0||_progress>1) return;
            if(!_isDismiss){
                _transitioningModel.interactiveTransitioningModel = [UIPercentDrivenInteractiveTransition new];
                [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
                _isDismiss = YES;
            }
            [_transitioningModel.interactiveTransitioningModel updateInteractiveTransition:_progress];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            if([gesture velocityInView:gesture.view].x < -500){
                [_transitioningModel.interactiveTransitioningModel finishInteractiveTransition];
                _transitioningModel.interactiveTransitioningModel = nil;
                _isDismiss = NO;
                return;
            }else if ([gesture velocityInView:gesture.view].x > 500){
                [_transitioningModel.interactiveTransitioningModel cancelInteractiveTransition];
                _transitioningModel.interactiveTransitioningModel = nil;
                _isDismiss = NO;
                return;
            }
            NSLog(@"percentComplete:%f",_transitioningModel.interactiveTransitioningModel.percentComplete);
            if(_transitioningModel.interactiveTransitioningModel.percentComplete>0.3f){
                //修改动画速度，让动画不显得那么突兀
                _transitioningModel.interactiveTransitioningModel.completionSpeed = 0.4f;
                [_transitioningModel.interactiveTransitioningModel finishInteractiveTransition];
            }else{
                //修改动画速度，让动画不显得那么突兀
                _transitioningModel.interactiveTransitioningModel.completionSpeed = 0.3f;
                [_transitioningModel.interactiveTransitioningModel cancelInteractiveTransition];
            }
            _transitioningModel.interactiveTransitioningModel = nil;
            _isDismiss = NO;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if(touch.view != self.containerView) return NO;
    return YES;
}

@end
