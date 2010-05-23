//
//  GradientView.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import "GradientView.h"

#import "Gradient.h"

@implementation GradientView

@synthesize gradient;

- (void)setGradient:(Gradient *)newGradient {
    if (gradient == newGradient) return;
    [gradient release];
    gradient = [newGradient retain];
    [self setNeedsDisplay];
}

- (void)dealloc {
    [gradient release];
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();

    NSArray *colors = gradient.CGColors;
    CGColorRef color = (CGColorRef) [colors objectAtIndex:0];

    if (colors.count == 1) {
        CGContextSetFillColorWithColor(context, color);
        CGContextFillRect(context, bounds);
        return;
    }

    CGColorSpaceRef colorSpace = CGColorGetColorSpace(color);
    CGGradientRef CGGradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colors, NULL);

    CGPoint start = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds));
    CGPoint end = CGPointMake(CGRectGetMidX(bounds), CGRectGetMaxY(bounds));

    CGGradientDrawingOptions options = 0;

    CGContextDrawLinearGradient(context, CGGradient, start, end, options);

    CGGradientRelease(CGGradient);
}

@end
