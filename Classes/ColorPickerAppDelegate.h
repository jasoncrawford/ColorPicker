//
//  ColorPickerAppDelegate.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright Kima Labs, Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;

@end

