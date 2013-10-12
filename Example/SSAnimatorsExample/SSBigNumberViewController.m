//
//  SSBigNumberViewController.m
//  SSAnimatorsExample
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSBigNumberViewController.h"

@interface SSBigNumberViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SSBigNumberViewController

- (id)init {
  if( ( self = [super init] ) ) {
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectInset(self.view.frame, 10, 20)];
    _label.backgroundColor = [UIColor clearColor];
    _label.textColor = [UIColor darkGrayColor];
    _label.font = [UIFont systemFontOfSize:72.0f];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_label];    
  }
  
  return self;
}

+ (instancetype)viewControllerWithNumber:(NSUInteger)number {
  SSBigNumberViewController *vc = [SSBigNumberViewController new];
  
  vc.label.text = [NSString stringWithFormat:@"%i", number];
  
  return vc;
}

@end
