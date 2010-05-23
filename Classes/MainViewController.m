//
//  MainViewController.m
//  ColorPicker
//
//  Created by Jason Crawford on 5/14/10.
//  Copyright 2010 Kima Labs, Inc. All rights reserved.
//

#import "MainViewController.h"

#import "Color.h"
#import "ColorPickerViewController.h"
#import "Gradient.h"
#import "GradientView.h"
#import "Observer.h"

@interface MainViewController () <Observer>

@property (nonatomic, readonly) Color *selectedColor;

@end

@implementation MainViewController

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        Color *color = [Color color];

        gradient = [[Gradient alloc] initWithColor:color];
        gradient.hueLock = YES;
        [gradient addObserver:self];

        colorPickerViewController = [ColorPickerViewController new];
        colorPickerViewController.color = color;
    }
    return self;
}

@synthesize gradientView;
@synthesize palletteView;
@synthesize slider;

@synthesize colorPickerFrameView;

@synthesize addButton;
@synthesize removeButton;
@synthesize segmentedControl;

- (void)dealloc {
    [gradient release];
    [colorPickerViewController release];
    [super dealloc];
}

- (Color *)selectedColor {
    return [gradient colorAtIndex:segmentedControl.selectedSegmentIndex];
}

- (void)refreshView {
    colorPickerViewController.color = self.selectedColor;
    [gradientView setNeedsDisplay];
    palletteView.backgroundColor = self.selectedColor.UIColor;
    removeButton.enabled = gradient.count > 1;
}

- (void)viewDidLoad {
    gradientView.gradient = gradient;
    [colorPickerFrameView addSubview:colorPickerViewController.view];
    [self refreshView];
}

- (void)objectDidChange:(NSNotification *)notification {
    [self refreshView];
}

- (IBAction)addPressed {
    NSLog(@"addPressed");
    Color *color = [Color colorWithColor:self.selectedColor];
    NSInteger index = segmentedControl.selectedSegmentIndex + 1;
    [gradient insertColor:color atIndex:index];
    [segmentedControl insertSegmentWithTitle:@"" atIndex:index animated:YES];
    segmentedControl.selectedSegmentIndex = index;
    [self refreshView];
}

- (IBAction)removePressed {
    NSLog(@"removePressed");
    NSInteger index = segmentedControl.selectedSegmentIndex;
    [gradient removeColorAtIndex:index];
    [segmentedControl removeSegmentAtIndex:index animated:YES];

    if (index >= gradient.count) index--;
    segmentedControl.selectedSegmentIndex = index;

    [self refreshView];
}

- (IBAction)segmentedControlValueChanged {
    NSLog(@"segmentedControlValueChanged: segmentedControl.selectedSegmentIndex=%d", segmentedControl.selectedSegmentIndex);
    [self refreshView];
}

@end
