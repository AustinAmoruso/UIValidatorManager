//
//  UIValidatorManager.h
//  SnapBi
//
//  Created by Austin Amoruso on 3/28/14.
//  Copyright (c) 2014 SnapBi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIValidatorDelegate.h"

@interface UIValidatorManager : NSObject

-(void)addValidator:(id<UIValidatorDelegate>)delegate;

-(void)removeValidator:(id<UIValidatorDelegate>)delegate;

-(void)setEnableed:(BOOL)on;

-(void)createValidator:(UIView *)view flash:(UIView *)flash rule:(bool (^)(void))block;

-(bool)isValid;

@end
