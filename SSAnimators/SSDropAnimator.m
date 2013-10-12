//
//  SSDropAnimator.m
//  Pods
//
//  Created by Jonathan Hersh on 10/11/13.
//
//

#import "SSAnimators.h"

@implementation SSDropAnimator

+ (instancetype)dropAnimatorWithDirection:(SSDropDirection)direction duration:(NSTimeInterval)duration {
    SSDropAnimator *animator = [SSDropAnimator new];
    
    animator.direction = direction;
    
    animator.beforeAnimationBlock = ^(UIViewController *fromVC,
                                  UIViewController *toVC,
                                  SSDropAnimator *animator,
                                  UIView *animationView) {
        
        if( animator.direction == SSDropDirectionUp ) {
            [toVC.view setFrame:(CGRect){ { 0, CGRectGetHeight(animationView.frame) },
                                          toVC.view.frame.size }];
            [animationView insertSubview:toVC.view
                            aboveSubview:fromVC.view];
        } else {
            [animationView insertSubview:toVC.view
                            belowSubview:fromVC.view];
        }
    };
    
    SSAnimationBlock animationBlock = ^(UIViewController *fromVC,
                                        UIViewController *toVC,
                                        SSDropAnimator *animator,
                                        UIView *animationView) {
        if( animator.direction == SSDropDirectionDown )
            fromVC.view.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(animationView.frame));
        else
            toVC.view.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(animationView.frame));
    };
    
    [animator addAnimation:[SSAnimation animationWithBlock:animationBlock
                                                  duration:duration
                                                   options:UIViewAnimationOptionCurveEaseIn]];
    
    return animator;
}

@end
