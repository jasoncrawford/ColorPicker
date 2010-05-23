//
//  Observer.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import "Observer.h"

static NSString *ObjectDidChangeNotification = @"ObjectDidChangeNotification";

@implementation NSObject (Observer)

- (void)addObserver:(id<Observer>)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:ObjectDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(objectDidChange:) name:ObjectDidChangeNotification object:self];
}

- (void)removeObserver:(id<Observer>)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:ObjectDidChangeNotification object:self];
}

- (void)notifyObservers {
    [[NSNotificationCenter defaultCenter] postNotificationName:ObjectDidChangeNotification object:self];
}

@end
