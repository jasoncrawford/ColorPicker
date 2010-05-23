//
//  Color.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Color : NSObject {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
}

+ (Color *)color;
+ (Color *)colorWithColor:(Color *)color;

@property (nonatomic, assign) CGFloat hue;
@property (nonatomic, assign) CGFloat saturation;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, readonly) UIColor *UIColor;

@end
