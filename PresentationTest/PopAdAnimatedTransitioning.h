//
//  PopAdAnimatedTransitioning.h
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopAdAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, readwrite) BOOL isPresentation;
@end
