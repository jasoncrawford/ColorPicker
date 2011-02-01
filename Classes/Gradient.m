//
//  Gradient.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import "Gradient.h"

#import "Color.h"
#import "Observer.h"

@interface Gradient () <Observer>

@end

@implementation Gradient

- (id)initWithColor:(Color *)color {
    return [self initWithColors:[NSArray arrayWithObject:color]];
}

- (id)initWithColors:(NSArray *)c {
    if (self = [super init]) {
        colors = [[NSMutableArray alloc] initWithArray:c];
        [colors makeObjectsPerformSelector:@selector(addObserver:) withObject:self];

        NSInteger count = colors.count;
        locations = [[NSMutableArray alloc] initWithCapacity:count];
        CGFloat step = 1.0 / (count-1);
        for (int i = 0; i < count; i++) {
            CGFloat location = (i==0)? 0.0 : (i==count-1)? 1.0 : i * step;
            [locations addObject:[NSNumber numberWithFloat:location]];
        }
    }
    return self;
}

@synthesize colors;
@synthesize hueLock;

- (void)dealloc {
    [colors release];
    [super dealloc];
}

- (NSInteger)count {
    return colors.count;
}

- (BOOL)indexIsInBounds:(NSInteger)index {
    return index >= 0 && index < self.count;
}

- (Color *)colorAtIndex:(NSInteger)index {
    if (![self indexIsInBounds:index]) return nil;
    return [colors objectAtIndex:index];
}

- (CGFloat)locationAtIndex:(NSInteger)index {
    if (![self indexIsInBounds:index]) return 0;
    return [[locations objectAtIndex:index] floatValue];
}

- (void)insertColor:(Color *)color atIndex:(NSInteger)index {
    [color addObserver:self];

    CGFloat location;
    if (index == 0) location = 0.0;
    else if (index == colors.count) location = 1.0;
    else {
        CGFloat before = [self locationAtIndex:index-1];
        CGFloat after = [self locationAtIndex:index];
        location = (before+after)/2.0;
    }

    [colors insertObject:color atIndex:index];
    [locations insertObject:[NSNumber numberWithFloat:location] atIndex:index];
    [self notifyObservers];
}

- (void)removeColorAtIndex:(NSInteger)index {
    if (![self indexIsInBounds:index]) return;
    Color *color = [self colorAtIndex:index];
    [color removeObserver:self];
    [colors removeObjectAtIndex:index];
    [locations removeObjectAtIndex:index];
    [self setLocationAtIndex:0 to:0];
    [self setLocationAtIndex:self.count-1 to:1];
    [self notifyObservers];
}

- (BOOL)locationIsSettable:(NSInteger)index {
    if (![self indexIsInBounds:index]) return NO;
    if (index == 0) return NO;
    if (index == self.count-1) return NO;
    return YES;
}

- (void)setLocationAtIndex:(NSInteger)index to:(CGFloat)location {
    if (![self locationIsSettable:index]) return;
    [locations replaceObjectAtIndex:index withObject:[NSNumber numberWithFloat:location]];
    [self notifyObservers];
}

- (NSArray *)CGColors {
    NSMutableArray *CGColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (Color *color in colors) [CGColors addObject:(id)color.UIColor.CGColor];
    return CGColors;
}

- (CGGradientRef)createCGGradient {
    NSArray *CGColors = self.CGColors;
    CGColorRef color = (CGColorRef) [CGColors objectAtIndex:0];
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(color);

    CGFloat locationArray[self.count];
    for (int i = 0; i < locations.count; i++) {
        locationArray[i] = [[locations objectAtIndex:i] floatValue];
    }

    return CGGradientCreateWithColors(colorSpace, (CFArrayRef) CGColors, locationArray);
}

- (void)objectDidChange:(NSNotification *)notification {
    if (hueLock) {
        Color *color = notification.object;
        for (Color *c in colors) c.hue = color.hue;
    }
    [self notifyObservers];
}

@end
