//
//  MultiViewController.m
//  CustomMultipleView
//
//  Created by AppMan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MultiViewController.h"

@interface MultiViewController ()

@end

@implementation MultiViewController

@synthesize masterNav;
@synthesize detailNav;
@synthesize masterView;
@synthesize detailView;
@synthesize separatorView;
@synthesize masterViewController;
@synthesize detailViewController;

- (id)initWithHeaderHeight:(float)height splitPoint:(float)point
{
    if(self = [super init]){
        headerHeight = height;
        splitPoint = point;
    }
    return self;
}

- (id)init
{
    if(self = [super init]){
        headerHeight = 300.0;
        splitPoint = 300.0;
    }
    return self;
}

- (void)setPositionView
{
    float height = headerHeight;
    float point = splitPoint;
    
    if(UIInterfaceOrientationIsLandscape(getOrientation)){
        height = (self.view.frame.size.height/self.view.frame.size.width)*height;
        point = (self.view.frame.size.width/self.view.frame.size.height)*point;
    }
    
    masterPoint.x = 0.0;
    masterPoint.y = height;
    masterSize.width = point;
    masterSize.height = self.view.frame.size.height - height;
    
    detailPoint.x = point + 4.0;
    detailPoint.y = height;
    detailSize.width = self.view.frame.size.width - detailPoint.x;
    detailSize.height = self.view.frame.size.height - height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)createMutipleView
{
    [self setPositionView];
    
    if(masterView){
        [masterView removeFromSuperview];
        [detailView removeFromSuperview];
        [separatorView removeFromSuperview];
    }
    
    masterView = [[UIView alloc] initWithFrame:CGRectMake(masterPoint.x, masterPoint.y, masterSize.width, masterSize.height)];
    
    detailView = [[UIView alloc] initWithFrame:CGRectMake(detailPoint.x, detailPoint.y, detailSize.width, detailSize.height)];
    
    separatorView = [[UIView alloc] initWithFrame:CGRectMake(masterSize.width, masterPoint.y, 4.0, masterSize.height)];
    [separatorView setBackgroundColor:[UIColor blackColor]];

    [self.view addSubview:masterView];
    [self.view addSubview:separatorView];
    [self.view addSubview:detailView];
    
    masterNav.view.frame = masterView.bounds;
    masterViewController.view.frame = masterNav.view.bounds;
    
    detailNav.view.frame = detailView.bounds;
    detailViewController.view.frame = detailNav.view.bounds;
    
    [masterView addSubview:masterNav.view];
    [detailView addSubview:detailNav.view];
}

- (void)addMasterViewController:(UIViewController *)controller animated:(BOOL)anim
{
    [self createMutipleView];
    
    masterViewController = controller;
    
    [masterNav.view removeFromSuperview];
    masterNav = nil;
    
    masterNav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    masterNav.view.frame = masterView.bounds;
    controller.view.frame = masterNav.view.bounds;
    
    [masterView addSubview:masterNav.view];
}

- (void)addDetailViewController:(UIViewController *)controller animated:(BOOL)anim
{
    detailViewController = controller;
    
    [detailNav.view removeFromSuperview];
    detailNav = nil;
    
    detailNav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    detailNav.view.frame = detailView.bounds;
    controller.view.frame = detailNav.view.bounds;
    
    [detailView addSubview:detailNav.view];
}

- (void)handleOrientation:(UIInterfaceOrientation)orientation
{
    getOrientation = orientation;
    
    [self setPositionView];
    [self createMutipleView];
    /*
    if(UIInterfaceOrientationIsPortrait(getOrientation)){
        NSLog(@"Portrait");
    }else if(UIInterfaceOrientationIsLandscape(getOrientation)){
        NSLog(@"Landscape");
    }
     */
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{   
    return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
