//
//  SSZoomAnimation.h
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSBaseAnimator.h"

/**
 * iOS 7 view controller animator object that does a simple zoom in/out animation.
 */

typedef NS_ENUM( NSUInteger, SSZoomDirection ) {
  SSZoomDirectionIn,
  SSZoomDirectionOut
};

@interface SSZoomAnimator : SSBaseAnimator

@property (nonatomic, assign) SSZoomDirection direction;

/**
 * Create an animator that performs a simple zoom in/out animation.
 */
+ (instancetype) zoomAnimatorWithDirection:(SSZoomDirection)direction 
                                  duration:(NSTimeInterval)duration;

@end
