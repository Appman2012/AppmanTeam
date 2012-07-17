//
//  RootViewController.h
//  CustomMultipleView
//
//  Created by AppMan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultiViewController;
@class MasterViewController;
@class DetailViewController;

@interface RootViewController : UIViewController

@property (nonatomic, strong) MultiViewController *multiViewController;
@property (nonatomic, strong) MasterViewController *masterViewController;
@property (nonatomic, strong) DetailViewController *detailViewController;

@end
