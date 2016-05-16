//
//  PopAdAnimatedTransitioning.swift
//  PresentationTest
//
//  Created by Minxin Guo on 5/5/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

import UIKit

class PopAdAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresentation: Bool = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromView = fromVC?.view
        let toView = toVC?.view
        let containerView = transitionContext.containerView()
        
        if (isPresentation) {
            containerView?.addSubview(toView!)
        }
        
        let animatingVC = isPresentation ? toVC : fromVC
        let animatingView = animatingVC?.view
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(animatingVC!)
        var initalFrameForVC = finalFrameForVC
        initalFrameForVC.origin.y -= initalFrameForVC.size.height
        
        let initialFrame = isPresentation ? initalFrameForVC : finalFrameForVC
        let finalFrame = isPresentation ? finalFrameForVC : initalFrameForVC
        
        animatingView?.frame = initialFrame
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay:0, usingSpringWithDamping:0.6, initialSpringVelocity:5.0, options:UIViewAnimationOptions.AllowUserInteraction, animations:{
            animatingView?.frame = finalFrame
            }, completion:{ (value: Bool) in
                if !self.isPresentation {
                    fromView?.removeFromSuperview()
                }
                transitionContext.completeTransition(true)
        })
    }
}
