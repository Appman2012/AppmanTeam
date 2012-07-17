//
//  MultiViewController.h
//  CustomMultipleView
//
//  Created by AppMan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiViewController : UIViewController
{
    UINavigationController *masterNav;
    UINavigationController *detailNav;
    
    UIView *masterView;
    UIView *detailView;
    UIView *separatorView;
    
    UIInterfaceOrientation getOrientation;
    
    CGFloat headerHeight;
    CGFloat splitPoint;
    
    CGSize masterSize;
    CGSize detailSize;
    
    CGPoint masterPoint;
    CGPoint detailPoint;
}

@property (nonatomic, strong) UINavigationController *masterNav;
@property (nonatomic, strong) UINavigationController *detailNav;
@property (nonatomic, strong) UIViewController *masterViewController;
@property (nonatomic, strong) UIViewController *detailViewController;

@property (nonatomic, strong) UIView *masterView;
@property (nonatomic, strong) UIView *detailView;
@property (nonatomic, strong) UIView *separatorView;

- (id)initWithHeaderHeight:(float)height splitPoint:(float)point;
- (void)handleOrientation:(UIInterfaceOrientation)orientation;

- (void)addMasterViewController:(UIViewController *)controller animated:(BOOL)anim;
- (void)addDetailViewController:(UIViewController *)controller animated:(BOOL)anim;

@end
