//
//  Gradient.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Color;

@interface Gradient : NSObject {
    NSMutableArray *colors;
    NSMutableArray *locations;
    BOOL hueLock;
}

- (id)initWithColor:(Color *)color;
- (id)initWithColors:(NSArray *)colors;

@property (nonatomic, readonly) NSArray *colors;
@property (nonatomic, assign) BOOL hueLock;

@property (nonatomic, readonly) NSInteger count;

- (Color *)colorAtIndex:(NSInteger)index;
- (CGFloat)locationAtIndex:(NSInteger)index;
- (void)insertColor:(Color *)color atIndex:(NSInteger)index;
- (void)removeColorAtIndex:(NSInteger)index;
- (BOOL)locationIsSettable:(NSInteger)index;
- (void)setLocationAtIndex:(NSInteger)index to:(CGFloat)location;

- (NSArray *)CGColors;
- (CGGradientRef)createCGGradient;

@end
