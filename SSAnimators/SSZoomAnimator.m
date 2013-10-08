//
//  SSZoomAnimation.m
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSZoomAnimator.h"

@implementation SSZoomAnimator

+ (instancetype) zoomAnimatorWithDirection:(ZZoomAnimationDirection)direction {
  
  SSAnimationBlock zoomAnimationBlock = ^(UIViewController *fromVC,
                                          UIViewController *toVC,
                                          SSZoomAnimator *animator) {
    CGAffineTransform transform;
    
    if( animator.direction == ZZoomAnimationDirectionIn )
      transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    else
      transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    
    fromVC.view.transform = transform;
  };
  
  SSZoomAnimator *animation = [SSZoomAnimator animatorWithAnimationBlock:zoomAnimationBlock];
  
  animation.direction = direction;
  
  return animation;
}

@end
