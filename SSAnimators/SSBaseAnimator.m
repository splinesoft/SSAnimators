//
//  SSBaseAnimator.m
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSBaseAnimator.h"

@interface SSBaseAnimator ()

// Try to fire an animation at the given index.
- (void) fireAnimationAtIndex:(NSUInteger)index 
                    inContext:(id <UIViewControllerContextTransitioning>)context;

@end

@implementation SSBaseAnimator

#pragma mark - init

- (id)init {
  if( ( self = [super init] ) ) {
    _animations = [NSMutableArray array];
    _animating = NO;
  }
  
  return self;
}

#pragma mark - Animation Setup

- (void)addAnimation:(SSAnimation *)animation {
  if( _animating ) {
    NSLog(@"ALERT: Added an animation to a transition already being animated.");
    return;
  }
  
  [_animations addObject:animation];
}

- (NSTimeInterval)totalAnimationDuration {
  NSTimeInterval total = 0.0f;
  
  for( SSAnimation *animation in _animations )
    total += animation.animationDuration;
  
  return total;
}

#pragma mark - Animation Firing

- (void) fireAnimationAtIndex:(NSUInteger)index 
                    inContext:(id<UIViewControllerContextTransitioning>)context {
    
  if( index >= [_animations count] ) {
    // Mark the animation complete.
    UIViewController *fromViewController = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromViewController.view.transform = CGAffineTransformIdentity;
    [context completeTransition:![context transitionWasCancelled]];
    _animating = NO;
    return;
  }
  
  SSAnimation *animation = _animations[index];
  
  [animation animateWithTransitionContext:context
                                 animator:self
                               completion:^(BOOL didFinish) {
                                 [self fireAnimationAtIndex:( index + 1 )
                                                  inContext:context];
                               }];
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  if( [_animations count] == 0 )
    return 0;
  
  return [self totalAnimationDuration];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  
  _animating = YES;
  
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  
  if( self.beforeAnimationBlock )
    self.beforeAnimationBlock( fromViewController, 
                               toViewController, 
                               self, 
                               [transitionContext containerView] );
  
  // Start animating!
  [self fireAnimationAtIndex:0
                   inContext:transitionContext];
}

@end
