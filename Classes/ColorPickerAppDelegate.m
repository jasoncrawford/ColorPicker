//
//  ColorPickerAppDelegate.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright Kima Labs, Inc 2010. All rights reserved.
//

#import "ColorPickerAppDelegate.h"
#import "ColorPickerViewController.h"

@implementation ColorPickerAppDelegate

@synthesize window;
@synthesize viewController;

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

@end
