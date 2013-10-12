//
//  SSZoomSlideAnimator.h
//  Pods
//
//  Created by Jonathan Hersh on 10/8/13.
//
//

#import "SSBaseAnimator.h"

typedef NS_ENUM( NSUInteger, SSSlideDirection ) {
  SSSlideDirectionLeft,
  SSSlideDirectionRight
};

@interface SSZoomSlideAnimator : SSBaseAnimator

+ (instancetype) zoomSlideAnimatorWithDirection:(SSSlideDirection)direction
                                       duration:(NSTimeInterval)duration;

@end
