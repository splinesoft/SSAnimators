//
//  SSZoomAnimation.h
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSBaseAnimator.h"

/**
 * iOS 7 animator object that does a zoom in/out animation.
 */

typedef NS_ENUM( NSUInteger, ZZoomAnimationDirection ) {
  ZZoomAnimationDirectionIn,
  ZZoomAnimationDirectionOut
};

@interface SSZoomAnimator : SSBaseAnimator

@property (nonatomic, assign) ZZoomAnimationDirection direction;

+ (instancetype) zoomAnimatorWithDirection:(ZZoomAnimationDirection)direction;

@end
