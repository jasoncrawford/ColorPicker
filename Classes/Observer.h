//
//  Observer.h
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Observer

- (void)objectDidChange:(id)object;

@end

@interface NSObject (Observer)

- (void)addObserver:(id<Observer>)observer;
- (void)removeObserver:(id<Observer>)observer;
- (void)notifyObservers;

@end
