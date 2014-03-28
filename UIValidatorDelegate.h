//
//  UIValidatorDelegate.h
//  SnapBi
//
//  Created by Austin Amoruso on 3/28/14.
//  Copyright (c) 2014 SnapBi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIValidatorDelegate <NSObject>

-(void)setEnabled:(bool)on;

-(bool)isValid;

@end
