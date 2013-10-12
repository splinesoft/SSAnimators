//
//  SSViewController.h
//  SSAnimatorsExample
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM( NSUInteger, SSTransitionType ) {
    SSTransitionTypeZoom,
    SSTransitionTypeDrop,
    SSTransitionTypeZoomSlide,
};

@interface SSViewController : UITableViewController <UINavigationControllerDelegate>

@end
