//
//  SSZoomAnimation.m
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSAnimators.h"

@interface SSZoomAnimator ()

@property (nonatomic, assign) SSZoomDirection direction;

@end

@implementation SSZoomAnimator

+ (instancetype) zoomAnimatorWithDirection:(SSZoomDirection)direction
                                  duration:(NSTimeInterval)duration {
  
  SSZoomAnimator *animator = [SSZoomAnimator new];
  
  animator.direction = direction;
  
  animator.beforeAnimationBlock = ^(UIViewController *fromVC,
                                    UIViewController *toVC,
                                    SSZoomAnimator *animator,
                                    UIView *animationView) {
    toVC.view.alpha = 0.0f;
    
    [animationView addSubview:toVC.view];
  };
  
  SSAnimationBlock animationBlock = ^(UIViewController *fromVC,
                                      UIViewController *toVC,
                                      SSZoomAnimator *animator,
                                      UIView *animationView) {
    fromVC.view.alpha = 0.0f;
    toVC.view.alpha = 1.0f;
    
    CGAffineTransform transform;
    
    if( animator.direction == SSZoomDirectionIn )
      transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    else
      transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    
    fromVC.view.transform = transform;
  };
  
  [animator addAnimation:[SSAnimation animationWithBlock:animationBlock 
                                                duration:duration
                                                 options:UIViewAnimationOptionCurveEaseInOut]];
  
  return animator;
}

@end
