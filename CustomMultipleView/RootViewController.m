//
//  RootViewController.m
//  CustomMultipleView
//
//  Created by AppMan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MultiViewController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize multiViewController;
@synthesize masterViewController;
@synthesize detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"Root view did load");
    
    multiViewController = [[MultiViewController alloc] initWithHeaderHeight:200.0 splitPoint:300.0];
    masterViewController = [[MasterViewController alloc] init];
    detailViewController = [[DetailViewController alloc] init];
    
    [multiViewController addMasterViewController:masterViewController animated:NO];
    [multiViewController addDetailViewController:detailViewController animated:NO];
    
    [self.view addSubview:multiViewController.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [multiViewController handleOrientation:interfaceOrientation];
    return YES;
}

@end
