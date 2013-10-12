//
//  SSAnimation.m
//  SSAnimators
//
//  Created by Jonathan Hersh on 10/9/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSAnimation.h"

@implementation SSAnimation

- (id)init {
  if( ( self = [super init] ) ) {
    self.animationDuration = 0.3f;
    self.animationOptions = UIViewAnimationOptionCurveEaseInOut;
  }
  
  return self;
}

+ (instancetype)animationWithBlock:(SSAnimationBlock)block 
                          duration:(NSTimeInterval)duration 
                           options:(UIViewAnimationOptions)options {
  
  SSAnimation *animation = [self new];
  
  animation.animationBlock = block;
  animation.animationDuration = duration;
  animation.animationOptions = options;
  
  return animation;
}

#pragma mark - Animate

- (void)animateWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext 
                            animator:(id<UIViewControllerAnimatedTransitioning>)animator
                          completion:(void (^)(BOOL))completion {
  
  if( !self.animationBlock ) {
    NSLog(@"Animation %@ has no animation block. Skipping.", self);
    return;
  }
  
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  
  UIView *animationView = [transitionContext containerView];
  
  [UIView animateWithDuration:self.animationDuration
                        delay:0.0f
                      options:self.animationOptions
                   animations:^{
                     self.animationBlock( fromViewController, toViewController, animator, animationView );
                   }
                   completion:completion];
}

@end
