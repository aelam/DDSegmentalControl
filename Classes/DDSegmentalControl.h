//
//  DDSegmentalControl.h
//  SegementalControl
//
//  Created by ryan on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDSegmentalControl : UIControl {
    NSMutableArray *_items;
    NSInteger _selectedSegmentIndex;
    
    UIColor *_selectedColor;
    UIColor *_unselectedColor;
		
	UIColor *_selectedTextColor;
	UIColor *_unselectedTextColor;
	
	UIColor *_borderColor;
}

@property (nonatomic) NSInteger selectedSegmentIndex;
@property (nonatomic, retain)  UIColor *selectedColor;
@property (nonatomic, retain)  UIColor *unselectedColor;
@property (nonatomic, retain)  UIColor *selectedTextColor;
@property (nonatomic, retain)  UIColor *unselectedTextColor;
@property (nonatomic, retain)  UIColor *borderColor;
@property (nonatomic) BOOL roundCorner;

- (id)initWithItems:(NSMutableArray *)items;


- (void)setItems:(NSMutableArray *)anItems;
- (NSMutableArray *)items;

@end
