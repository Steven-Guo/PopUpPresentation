//
//  PopAdAnimatedTransitioning.m
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import "PopAdAnimatedTransitioning.h"

@implementation PopAdAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey: UITransitionContextFromViewKey];
    UIViewController *toVC = [transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = [transitionContext containerView];
    
    if (_isPresentation) {
        [containerView addSubview:toView];
    }
    
    UIViewController *animatingVC = _isPresentation ? toVC : fromVC;
    UIView *animatingView = animatingVC.view;
    CGRect finalFrameForVC = [transitionContext finalFrameForViewController:animatingVC];
    CGRect initialFrameForVC = finalFrameForVC;
    initialFrameForVC.origin.y -= initialFrameForVC.size.height;
    
    CGRect initialFrame = _isPresentation ? initialFrameForVC : finalFrameForVC;
    CGRect finalFrame = _isPresentation ? finalFrameForVC : initialFrameForVC;
    animatingView.frame = initialFrame;
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:0.6 animations:^{
        animatingView.frame = finalFrame;
    } completion:^(BOOL finished) {
        if (!_isPresentation) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:YES];
    }];
}
@end
