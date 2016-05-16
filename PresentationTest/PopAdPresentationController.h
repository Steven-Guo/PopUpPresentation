//
//  PopAdPresentationController.h
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopAdPresentationController : UIPresentationController<UIAdaptivePresentationControllerDelegate> {
    UIView *chromeView;
}
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController;
@end
