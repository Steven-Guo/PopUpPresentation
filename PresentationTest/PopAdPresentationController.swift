//
//  MyPresentationController.swift
//  PresentationTest
//
//  Created by Minxin Guo on 5/4/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

//http://www.appcoda.com/presentation-controllers-tutorial/

import UIKit

class PopAdPresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate {
    var chromeView: UIView = UIView()
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        chromeView.backgroundColor = UIColor(white:0.0, alpha:0.4)
        chromeView.layer.cornerRadius = 5.0
        chromeView.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(chromeViewTapped(_:)))
        chromeView.addGestureRecognizer(tap)
    }
    
    func chromeViewTapped(gesture: UITapGestureRecognizer) {
        if (gesture.state == .Ended) {
            presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = containerView!.bounds
        presentedViewFrame.size = sizeForChildContentContainer(presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = (containerBounds.size.width - presentedViewFrame.size.width) / 2
        presentedViewFrame.origin.y = (containerBounds.size.height - presentedViewFrame.size.height) / 2
        return presentedViewFrame
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSizeMake(CGFloat((floorf(Float(parentSize.width * 3 / 4.0)))), CGFloat((floorf(Float(parentSize.height * 2 / 3.0)))))
    }
    
    override func presentationTransitionWillBegin() {
        chromeView.frame = self.containerView!.bounds
        chromeView.alpha = 1.0
        containerView?.insertSubview(chromeView, atIndex: 0)
        let coordinator = presentedViewController.transitionCoordinator()
        if (coordinator != nil) {
            coordinator!.animateAlongsideTransition({ (context: UIViewControllerTransitionCoordinatorContext) in
                self.chromeView.alpha = 1.0
                }, completion: nil)
        } else {
            chromeView.alpha = 1.0
        }
    }
    
    override func dismissalTransitionWillBegin() {
        let coordinator = presentedViewController.transitionCoordinator()
        if (coordinator != nil) {
            coordinator!.animateAlongsideTransition({ (context: UIViewControllerTransitionCoordinatorContext) in
                self.chromeView.alpha = 0.0
                }, completion: nil)
        } else {
            chromeView.alpha = 0.0
        }
    }
    
    //This sets the frames of the chrome and presented views to the bounds of the container view. If this isn’t done then they won’t resize if the device is rotated.
    override func containerViewDidLayoutSubviews() {
        chromeView.frame = containerView!.bounds
        presentedView()?.frame = frameOfPresentedViewInContainerView()
    }
    
    override func shouldPresentInFullscreen() -> Bool {
        return true
    }
    
    override func adaptivePresentationStyle() -> UIModalPresentationStyle {
        return .FullScreen
    }
}
