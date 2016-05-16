//
//  PopAdPresentationController.m
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import "PopAdPresentationController.h"

@implementation PopAdPresentationController
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    chromeView = [[UIView alloc] init];
    chromeView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    chromeView.layer.cornerRadius = 5.0;
    chromeView.alpha = 0.0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chromeViewTapped:)];
    [chromeView addGestureRecognizer:tap];
    return self;
}

- (void)chromeViewTapped:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect presentedViewFrame = CGRectZero;
    CGRect containerBounds = self.containerView.bounds;
    presentedViewFrame.size = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerBounds.size];
    presentedViewFrame.origin.x = (containerBounds.size.width - presentedViewFrame.size.width) / 2;
    presentedViewFrame.origin.y = (containerBounds.size.height - presentedViewFrame.size.height) / 2;
    return presentedViewFrame;
}

- (CGSize)sizeForChildContentContainer:(id <UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(floorf(parentSize.width * 3 / 4.0), floorf(parentSize.height * 2 / 3.0));
}

-(void)presentationTransitionWillBegin {
    chromeView.frame = self.containerView.bounds;
    chromeView.alpha = 1.0;
    [self.containerView insertSubview:chromeView atIndex:0];
    if (self.presentedViewController.transitionCoordinator != nil) {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            chromeView.alpha = 1.0;
        } completion:nil];
    } else {
        chromeView.alpha = 1.0;
    }
}

-(void)dismissalTransitionWillBegin {
    if (self.presentedViewController.transitionCoordinator != nil) {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            chromeView.alpha = 0.0;
        } completion:nil];
    } else {
        chromeView.alpha = 0.0;
    }
}

-(void)containerViewDidLayoutSubviews {
    chromeView.frame = self.containerView.bounds;
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
}

-(BOOL)shouldPresentInFullscreen {
    return true;
}

-(UIModalPresentationStyle)adaptivePresentationStyle {
    return UIModalPresentationFullScreen;
}
@end
