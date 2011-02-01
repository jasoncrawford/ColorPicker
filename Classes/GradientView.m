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

    if (gradient.count == 1) {
        NSArray *colors = gradient.CGColors;
        CGColorRef color = (CGColorRef) [colors objectAtIndex:0];
        CGContextSetFillColorWithColor(context, color);
        CGContextFillRect(context, bounds);
        return;
    }

    CGGradientRef CGGradient = [gradient createCGGradient];

    CGPoint start = CGPointMake(CGRectGetMinX(bounds), CGRectGetMidY(bounds));
    CGPoint end = CGPointMake(CGRectGetMaxX(bounds), CGRectGetMidY(bounds));

    CGGradientDrawingOptions options = 0;

    CGContextDrawLinearGradient(context, CGGradient, start, end, options);

    CGGradientRelease(CGGradient);
}

@end
