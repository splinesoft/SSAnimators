//
//  SSDropAnimator.h
//  Pods
//
//  Created by Jonathan Hersh on 10/11/13.
//
//

#import "SSBaseAnimator.h"

typedef NS_ENUM( NSUInteger, SSDropDirection ) {
    SSDropDirectionDown,
    SSDropDirectionUp,
};

@interface SSDropAnimator : SSBaseAnimator

+ (instancetype) dropAnimatorWithDirection:(SSDropDirection)direction
                                  duration:(NSTimeInterval)duration;

@end
