//
//  UITextValidator.h
//  SnapBi
//
//  Created by Austin Amoruso on 3/27/14.
//  Copyright (c) 2014 SnapBi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIValidatorDelegate.h"

@interface UITextValidator : NSObject <UITextViewDelegate, UIValidatorDelegate>


-(void)setTextView:(UIView *)view;

-(void)setRule:(bool (^)(void))block;

-(void)setFlashView:(UITableViewCell *)view;

@end
