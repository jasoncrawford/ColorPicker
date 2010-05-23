//
//  Color.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import "Color.h"

#import "Observer.h"

@implementation Color

+ (Color *)color {
    return [[Color new] autorelease];
}

+ (Color *)colorWithColor:(Color *)color {
    Color *newColor = [self color];
    newColor.hue = color.hue;
    newColor.saturation = color.saturation;
    newColor.brightness = color.brightness;
    return newColor;
}

@synthesize hue;
@synthesize saturation;
@synthesize brightness;

- (UIColor *)UIColor {
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0];
}

- (void)setHue:(CGFloat)newHue {
    if (hue == newHue) return;
    hue = newHue;
    [self notifyObservers];
}

- (void)setSaturation:(CGFloat)newSaturation {
    if (saturation == newSaturation) return;
    saturation = newSaturation;
    [self notifyObservers];
}

- (void)setBrightness:(CGFloat)newBrightness {
    if (brightness == newBrightness) return;
    brightness = newBrightness;
    [self notifyObservers];
}

@end
