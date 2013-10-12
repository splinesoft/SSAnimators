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
#import "SSAnimation.h"

@interface SSBaseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 * Return YES if we are currently animating.
 */
@property (nonatomic, readonly, getter = isAnimating) BOOL animating;

/**
 * Optional before-animation block, called just before the animation begins.
 */
@property (nonatomic, copy) SSAnimationBlock beforeAnimationBlock;

/**
 * Animation blocks.
 */
@property (nonatomic, strong) NSMutableArray *animations;

/**
 * Total animation duration is the sum of the durations in each individual animation.
 */
- (NSTimeInterval) totalAnimationDuration;

/**
 * Add an animation.
 */
- (void) addAnimation:(SSAnimation *)animation;

@end
