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
    BOOL hueLock;
}

- (id)initWithColor:(Color *)color;
- (id)initWithColors:(NSArray *)colors;

@property (nonatomic, readonly) NSArray *colors;
@property (nonatomic, assign) BOOL hueLock;

@property (nonatomic, readonly) NSInteger count;

- (Color *)colorAtIndex:(NSInteger)index;
- (void)insertColor:(Color *)color atIndex:(NSInteger)index;
- (void)removeColorAtIndex:(NSInteger)index;

- (NSArray *)UIColors;
- (NSArray *)CGColors;

@end
