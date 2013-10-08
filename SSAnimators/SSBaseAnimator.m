//
//  SSBaseAnimator.m
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSBaseAnimator.h"

@implementation SSBaseAnimator

#pragma mark - init

- (id)init {
  if( ( self = [super init] ) ) {
    self.animationOptions = UIViewAnimationOptionCurveEaseInOut;
    self.animationDuration = 0.3f;
  }
  
  return self;
}

+ (instancetype)animatorWithAnimationBlock:(SSAnimationBlock)block {
  SSBaseAnimator *animator = [self new];
  
  animator.animationBlock = block;
  
  return animator;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return self.animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  
  [[transitionContext containerView] addSubview:toViewController.view];
  toViewController.view.alpha = 0.0f;
  
  [UIView animateWithDuration:[self transitionDuration:transitionContext]
                        delay:0.0f
                      options:self.animationOptions
                   animations:^{   
                     
     fromViewController.view.alpha = 0.0f;
     toViewController.view.alpha = 1.0f;
                     
     if( self.animationBlock )
       self.animationBlock( fromViewController, toViewController, self );
                
   } completion:^(BOOL finished) {
     fromViewController.view.transform = CGAffineTransformIdentity;
     [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
   }];
}

@end
