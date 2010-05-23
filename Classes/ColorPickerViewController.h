//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright Kima Labs, Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Color;

@interface ColorPickerViewController : UIViewController {
    Color *color;

    UISlider *hueSlider;
    UISlider *saturationSlider;
    UISlider *brightnessSlider;

    UILabel *hueLabel;
    UILabel *saturationLabel;
    UILabel *brightnessLabel;
}

@property (nonatomic, retain) Color *color;

@property (nonatomic, assign) IBOutlet UISlider *hueSlider;
@property (nonatomic, assign) IBOutlet UISlider *saturationSlider;
@property (nonatomic, assign) IBOutlet UISlider *brightnessSlider;

@property (nonatomic, assign) IBOutlet UILabel *hueLabel;
@property (nonatomic, assign) IBOutlet UILabel *saturationLabel;
@property (nonatomic, assign) IBOutlet UILabel *brightnessLabel;

- (IBAction)hueSliderValueChanged;
- (IBAction)saturationSliderValueChanged;
- (IBAction)brightnessSliderValueChanged;

@end
