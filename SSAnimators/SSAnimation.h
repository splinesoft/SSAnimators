//
//  SSAnimation.h
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/9/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * An individual animation in a view controller transition.
 * SSBaseAnimator can chain together one or more of these to form a transition.
 */

/**
 * Animation block.
 */
typedef void (^SSAnimationBlock) (UIViewController *fromVC, 
                                  UIViewController *toVC, 
                                  id <UIViewControllerAnimatedTransitioning> animator,
                                  UIView *animationView);

@interface SSAnimation : NSObject

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
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 * Helper constructor.
 */
+ (instancetype) animationWithBlock:(SSAnimationBlock)block 
                           duration:(NSTimeInterval)duration 
                            options:(UIViewAnimationOptions)options;

/**
 * Fire the animation itself.
 */
- (void) animateWithTransitionContext:(id <UIViewControllerContextTransitioning>)context 
                             animator:(id <UIViewControllerAnimatedTransitioning>)animator
                           completion:(void (^)(BOOL))completion;

@end
