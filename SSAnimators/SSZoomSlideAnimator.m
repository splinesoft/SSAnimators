//
//  SSZoomSlideAnimator.m
//  Pods
//
//  Created by Jonathan Hersh on 10/8/13.
//
//

#import "SSAnimators.h"

@interface SSZoomSlideAnimator ()

@property (nonatomic, assign) SSSlideDirection slideDirection;

@end

@implementation SSZoomSlideAnimator

+ (instancetype)zoomSlideAnimatorWithDirection:(SSSlideDirection)direction duration:(NSTimeInterval)duration {
    SSZoomSlideAnimator *animator = [SSZoomSlideAnimator new];
    
    animator.slideDirection = direction;
    
    animator.beforeAnimationBlock = ^(UIViewController *fromVC,
                                      UIViewController *toVC,
                                      SSZoomSlideAnimator *animator,
                                      UIView *animationView) {
        [animationView insertSubview:toVC.view
                        belowSubview:fromVC.view];
        
        toVC.view.center = CGPointMake( 2 * CGRectGetWidth(animationView.frame), CGRectGetMidY(animationView.frame));
    };
    
    // 1. Zoom out
    SSAnimationBlock zoomAnimation = ^(UIViewController *fromVC,
                                       UIViewController *toVC,
                                       SSZoomSlideAnimator *animator,
                                       UIView *animationView) {
        
        fromVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        toVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    };
    
    [animator addAnimation:[SSAnimation animationWithBlock:zoomAnimation
                                                  duration:duration / 3
                                                   options:UIViewAnimationOptionCurveEaseInOut]];
    
    // 2. Slide
    SSAnimationBlock slideAnimation = ^(UIViewController *fromVC,
                                        UIViewController *toVC,
                                        SSZoomSlideAnimator *animator,
                                        UIView *animationView) {
        CGFloat offsetX = CGRectGetWidth(toVC.view.frame) / 2.0f;
        
        toVC.view.transform = CGAffineTransformMakeTranslation(( animator.slideDirection == SSSlideDirectionRight ? offsetX : -offsetX), 0);
    };
    
    [animator addAnimation:[SSAnimation animationWithBlock:slideAnimation
                                                  duration:duration / 3
                                                   options:UIViewAnimationOptionCurveEaseInOut]];
    
    // 3. Zoom in
    SSAnimationBlock zoomInAnimation = ^(UIViewController *fromVC,
                                         UIViewController *toVC,
                                         SSZoomSlideAnimator *animator,
                                         UIView *animationView) {
        
        //fromVC.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
        toVC.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
    };
    
    [animator addAnimation:[SSAnimation animationWithBlock:zoomInAnimation
                                                  duration:duration / 3
                                                   options:UIViewAnimationOptionCurveEaseInOut]];
    
    return animator;
}

@end
