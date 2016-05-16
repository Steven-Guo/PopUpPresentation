//
//  PopAdTransitioningDelegate.swift
//  PresentationTest
//
//  Created by Minxin Guo on 5/5/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

import UIKit

class PopAdTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = PopAdPresentationController(presentedViewController: presented, presentingViewController: presenting)
        return presentationController
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = PopAdAnimatedTransitioning()
        animationController.isPresentation = true
        return animationController
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = PopAdAnimatedTransitioning()
        animationController.isPresentation = false
        return animationController
    }
}
