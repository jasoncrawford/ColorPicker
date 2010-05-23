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

- (void)insertColor:(Color *)color atIndex:(NSInteger)index {
    [color addObserver:self];
    [colors insertObject:color atIndex:index];
    [self notifyObservers];
}

- (void)removeColorAtIndex:(NSInteger)index {
    if (![self indexIsInBounds:index]) return;
    Color *color = [self colorAtIndex:index];
    [color removeObserver:self];
    [colors removeObjectAtIndex:index];
    [self notifyObservers];
}

- (NSArray *)UIColors {
    NSMutableArray *UIColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (Color *color in colors) [UIColors addObject:color.UIColor];
    return UIColors;
}

- (NSArray *)CGColors {
    NSMutableArray *CGColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (Color *color in colors) [CGColors addObject:(id)color.UIColor.CGColor];
    return CGColors;
}

- (void)objectDidChange:(NSNotification *)notification {
    if (hueLock) {
        Color *color = notification.object;
        for (Color *c in colors) c.hue = color.hue;
    }
    [self notifyObservers];
}

@end
