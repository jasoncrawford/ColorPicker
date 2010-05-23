//
//  GradientView.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Gradient;

@interface GradientView : UIView {
    Gradient *gradient;
}

@property (nonatomic, retain) Gradient *gradient;

@end
