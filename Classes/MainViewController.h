//
//  MainViewController.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorPickerViewController;
@class Gradient;
@class GradientView;

@interface MainViewController : UIViewController {
    Gradient *gradient;
    ColorPickerViewController *colorPickerViewController;

    GradientView *gradientView;
    UIView *palletteView;
    UISlider *slider;

    UIView *colorPickerFrameView;

    UIButton *addButton;
    UIButton *removeButton;
    UISegmentedControl *segmentedControl;
}

@property (nonatomic, assign) IBOutlet GradientView *gradientView;
@property (nonatomic, assign) IBOutlet UIView *palletteView;
@property (nonatomic, assign) IBOutlet UISlider *slider;
@property (nonatomic, assign) IBOutlet UIView *colorPickerFrameView;

@property (nonatomic, assign) IBOutlet UIButton *addButton;
@property (nonatomic, assign) IBOutlet UIButton *removeButton;
@property (nonatomic, assign) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)addPressed;
- (IBAction)removePressed;
- (IBAction)segmentedControlValueChanged;

@end
