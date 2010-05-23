//
//  ColorPickerViewController.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright Kima Labs, Inc 2010. All rights reserved.
//

#import "ColorPickerViewController.h"

#import "Color.h"
#import "Observer.h"

@interface ColorPickerViewController () <Observer>

@end

@implementation ColorPickerViewController

@synthesize color;

@synthesize hueSlider;
@synthesize saturationSlider;
@synthesize brightnessSlider;

@synthesize hueLabel;
@synthesize saturationLabel;
@synthesize brightnessLabel;

- (void)dealloc {
    [color release];
    [super dealloc];
}

- (void)refreshView {
    if (![self isViewLoaded]) return;

    hueSlider.value = color.hue;
    saturationSlider.value = color.saturation;
    brightnessSlider.value = color.brightness;

    hueLabel.text = [NSString stringWithFormat:@"%.2f", color.hue];
    saturationLabel.text = [NSString stringWithFormat:@"%.2f", color.saturation];
    brightnessLabel.text = [NSString stringWithFormat:@"%.2f", color.brightness];
}

- (void)setColor:(Color *)newColor {
    if (color == newColor) return;
    [color removeObserver:self];
    [color release];
    color = [newColor retain];
    [color addObserver:self];
    [self refreshView];
}

- (void)viewDidLoad {
    [self refreshView];
}

- (IBAction)hueSliderValueChanged {
    color.hue = hueSlider.value;
}

- (IBAction)saturationSliderValueChanged {
    color.saturation = saturationSlider.value;
}

- (IBAction)brightnessSliderValueChanged {
    color.brightness = brightnessSlider.value;
}

- (void)objectDidChange:(NSNotification *)notification {
    [self refreshView];
}

@end
