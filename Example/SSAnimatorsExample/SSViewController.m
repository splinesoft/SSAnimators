//
//  SSViewController.m
//  SSAnimatorsExample
//
//  Created by Jonathan Hersh on 10/8/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSViewController.h"
#import "SSBigNumberViewController.h"
#import <SSDataSources.h>
#import <SSAnimators.h>

@interface SSViewController ()

@property (nonatomic, strong) SSArrayDataSource *dataSource;

@property (nonatomic, assign) SSTransitionType selectedTransitionType;

@end

@implementation SSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"SSAnimators";
  
    self.dataSource = [[SSArrayDataSource alloc] initWithItems:@[
        @(SSTransitionTypeZoom),
        @(SSTransitionTypeDrop),
        @(SSTransitionTypeZoomSlide),
    ]];
    self.dataSource.cellConfigureBlock = ^(SSBaseTableCell *cell,
                                           NSNumber *type,
                                           UITableView *tableView,
                                           NSIndexPath *indexPath) {
      
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
      
      switch( (SSTransitionType)[type unsignedIntegerValue] ) {
        case SSTransitionTypeZoom:
              cell.textLabel.text = @"Zoom";
              break;
          case SSTransitionTypeDrop:
              cell.textLabel.text = @"Drop";
              break;
          case SSTransitionTypeZoomSlide:
              cell.textLabel.text = @"Zoom-Slide";
              break;
        default:
              break;
      }
    };
  
    self.dataSource.tableView = self.tableView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedTransitionType = (SSTransitionType)[[_dataSource itemAtIndexPath:indexPath] unsignedIntegerValue];
    SSBigNumberViewController *newVC = [SSBigNumberViewController viewControllerWithNumber:arc4random_uniform(100)];
  
    [self.navigationController pushViewController:newVC
                                         animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController 
                                  animationControllerForOperation:(UINavigationControllerOperation)operation 
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
  
  BOOL isPush = operation == UINavigationControllerOperationPush;
  NSTimeInterval randomDuration = (0.5f + arc4random_uniform(10) * 0.1f);
    
  switch( self.selectedTransitionType ) {
    case SSTransitionTypeZoom: {
      SSZoomAnimator *zoomer = [SSZoomAnimator zoomAnimatorWithDirection:( isPush 
                                                                           ? SSZoomDirectionIn
                                                                           : SSZoomDirectionOut )
                                                                duration:randomDuration];
      
      return zoomer;
    }
    case SSTransitionTypeDrop:
      return [SSDropAnimator dropAnimatorWithDirection:( isPush
                                                         ? SSDropDirectionDown
                                                         : SSDropDirectionUp )
                                              duration:0.3f];
      case SSTransitionTypeZoomSlide:
          return [SSZoomSlideAnimator zoomSlideAnimatorWithDirection:( isPush
                                                                       ? SSSlideDirectionLeft
                                                                       : SSSlideDirectionRight )
                                                            duration:0.8f];
    default:
      break;
  }
  
  return nil;
}

@end
