//
//  DDSegmentalControl.m
//  SegementalControl
//
//  Created by ryan on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DDSegmentalControl.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Color.h"

@interface DDSegmentalControl (Private)

- (void)buttonAction:(UIButton *)button;
- (void)setDefaultValues;

@end


@implementation DDSegmentalControl

@synthesize selectedSegmentIndex = _selectedSegmentIndex;

@synthesize selectedColor = _selectedColor;
@synthesize unselectedColor = _unselectedColor;
@synthesize selectedTextColor = _selectedTextColor;
@synthesize unselectedTextColor = _unselectedTextColor;
@synthesize borderColor = _borderColor;

#define BUTTON_TAG_OFFSET	100

- (id)initWithItems:(NSMutableArray *)items
{
    self = [self initWithFrame:CGRectZero];
	[self setItems:items];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
        [self setDefaultValues];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
        [self setDefaultValues];
	}
	return self;
}

- (void)setDefaultValues {
    self.selectedSegmentIndex = -1;
    
    self.clipsToBounds = YES;
    
    self.layer.cornerRadius = 8.0f;
    self.layer.borderColor = [UIColor colorWithRed:0.76 green:0.76 blue:0.76 alpha:1].CGColor;
    self.layer.borderWidth = 1.f;
    
    self.borderColor = [UIColor colorWithRed:0.76 green:0.76 blue:0.76 alpha:1];
    
    self.selectedColor = [UIColor colorWithRed:0.18 green:0.72 blue:0.94 alpha:1];
    self.unselectedColor = [UIColor whiteColor];
    
    self.selectedTextColor = [UIColor whiteColor];
    self.unselectedTextColor = [UIColor blackColor];				
    
}


- (void)setItems:(NSMutableArray *)anItems {
	[_items release];
	_items = [[NSMutableArray alloc] init];
	int buttonTag = BUTTON_TAG_OFFSET;
	for (id e in anItems) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

		button.tag = buttonTag;
		if ([e isKindOfClass:[NSString class]]) {
			[button setTitle:e forState:UIControlStateNormal];
			[button setTitle:e forState:UIControlStateSelected];
			[button setTitle:e forState:UIControlStateHighlighted];
			
		} else if ([e isKindOfClass:[UIImage class]]) {
			[button setImage:e forState:UIControlStateNormal];
			[button setImage:e forState:UIControlStateSelected];
			[button setImage:e forState:UIControlStateHighlighted];
		}
		
		[button setTitleColor:self.selectedTextColor forState:UIControlStateSelected];
		[button setTitleColor:self.unselectedTextColor forState:UIControlStateNormal];
		
		[_items addObject:button];
		[self addSubview:button];
		buttonTag ++;
    }
}

- (NSMutableArray *)items {
	return _items;
}

- (void)setRoundCorner:(BOOL)roundCorner {
    if (roundCorner) {
        self.layer.cornerRadius = 8.0f;        
    } else {
        self.layer.cornerRadius = 0.0f;
    }

}

- (BOOL)roundCorner {
    if (self.layer.cornerRadius > 0) {
        return YES;
    } else {
        return NO;
    }
}


- (void)setSelectedSegmentIndex:(NSInteger)index {
    if (_selectedSegmentIndex == index) {
        return;
    }
    _selectedSegmentIndex = index;
	[self setNeedsDisplay];
}

#pragma mark private
- (void)buttonAction:(UIButton *)button {
	self.selectedSegmentIndex = button.tag - BUTTON_TAG_OFFSET;
	[self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	if (_items && [_items count]) {
		NSInteger width = rect.size.width / [_items count];
		NSInteger height = rect.size.height;
		for (UIButton * e in _items) {
			e.titleLabel.font = [UIFont systemFontOfSize:height * 0.5];
			if ((e.tag - BUTTON_TAG_OFFSET) == self.selectedSegmentIndex) {
				e.selected = YES;
				e.backgroundColor = self.selectedColor;
				e.titleLabel.textColor = self.selectedTextColor;                
				
				UIImage *image = [e imageForState:UIControlStateNormal];
				if (image) {
					image = [image imageWithOverlayColor:self.selectedTextColor];
					[e setImage:image forState:UIControlStateNormal];				
					[e setImage:image forState:UIControlStateSelected];				
					[e setImage:image forState:UIControlStateHighlighted];				
				}

			} else {
				e.selected = NO;
				e.backgroundColor = self.unselectedColor;
				e.titleLabel.textColor = self.unselectedTextColor;
				UIImage *image = [e imageForState:UIControlStateNormal];
				if (image) {
					image = [image imageWithOverlayColor:self.unselectedTextColor];
					[e setImage:image forState:UIControlStateNormal];				
					[e setImage:image forState:UIControlStateSelected];				
					[e setImage:image forState:UIControlStateHighlighted];				
				}
			}
			
			e.frame = CGRectMake((e.tag - BUTTON_TAG_OFFSET) * width, 0, width, height);
		}
	}
}

- (void)dealloc {
    [_selectedColor release];
    [_unselectedColor release];
	[_selectedTextColor release];
	[_unselectedTextColor release];
	[_borderColor release];
    [_items release];
    [super dealloc];
}

@end
