//
//  SWLeftTransitionModel.m
//  SWSlideController
//
//  Created by zhoushaowen on 2017/3/28.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWLeftSlideTransitioningModel.h"
#import "SWLeftSlidePresentationController.h"

@interface SWLeftSlideTransitioningModel ()

@end

@implementation SWLeftSlideTransitioningModel
{
    BOOL _isPresent;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    SWLeftSlidePresentationController *controller = [[SWLeftSlidePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    _isPresent = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    _isPresent = NO;
    return self;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactiveTransitioningModel;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactiveTransitioningModel;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if(_isPresent){
        [self doPresentAnimation:transitionContext];
    }else{
        [self doDismissAnimation:transitionContext];
    }
}

- (void)doPresentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:toView];
    CGRect rect = toView.frame;
    rect.origin.x = - rect.size.width;
    toView.frame = rect;
    containerView.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.35f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect rect = toView.frame;
        rect.origin.x = 0;
        toView.frame = rect;
        containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (void)doDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [UIView animateWithDuration:0.35f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect rect = fromView.frame;
        rect.origin.x = - rect.size.width;
        fromView.frame = rect;
        containerView.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}



@end
