//
//  PopAdTransitioningDelegate.m
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import "PopAdTransitioningDelegate.h"
#import "PopAdPresentationController.h"
#import "PopAdAnimatedTransitioning.h"

@implementation PopAdTransitioningDelegate
-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    PopAdPresentationController *presentationController = [[PopAdPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    PopAdAnimatedTransitioning *animationController = [[PopAdAnimatedTransitioning alloc] init];
    animationController.isPresentation = true;
    return  animationController;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    PopAdAnimatedTransitioning *animationController = [[PopAdAnimatedTransitioning alloc] init];
    animationController.isPresentation = false;
    return  animationController;
}

@end
