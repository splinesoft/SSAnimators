//
//  SSBaseAnimator.h
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

/**
 * A base animator object for iOS 7 view controller transitions.
 * This ought not be used directly; rather subclassed as appropriate.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * Animation block. Each subclass is responsible for implementing this as appropriate.
 */
typedef void (^SSAnimationBlock) (UIViewController *fromVC, 
                                  UIViewController *toVC, 
                                  id <UIViewControllerAnimatedTransitioning> animator);

@interface SSBaseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 * Animation block. Implement your animations here.
 */
@property (nonatomic, copy) SSAnimationBlock animationBlock;

/**
 * Animation curve to use for the animation.
 * Defaults to UIViewAnimationOptionCurveEaseInOut.
 */
@property (nonatomic, assign) UIViewAnimationOptions animationOptions;

/**
 * Animation duration. Defaults to 0.3f.
 */
@property (nonatomic, assign) CGFloat animationDuration;

/**
 * Helper constructor.
 */
+ (instancetype) animatorWithAnimationBlock:(SSAnimationBlock)block;

@end
