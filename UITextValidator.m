//
//  UITextValidator.m
//  SnapBi
//
//  Created by Austin Amoruso on 3/27/14.
//  Copyright (c) 2014 SnapBi. All rights reserved.
//

#import "UITextValidator.h"
#import "UIHelper.h"

@interface UITextValidator()

@property (strong,atomic) UIView * pText;

@property (strong,atomic) UITableViewCell * pCell;

@property (atomic) bool pEnabled;

@property (atomic) bool pFlashing;

@property (atomic) bool pValid;

@property (atomic,strong) bool (^pBlock) (void);

@property (atomic,strong) id me;

@end

@implementation UITextValidator

-(void)setTextView:(UIView *)view
{
    self.pText = view;
    self.me = self;
    if([self.pText isKindOfClass:[UITextField class]])
    {
        UITextField * utf = (UITextField *)self.pText;
        [utf addTarget:self.me action:@selector(check) forControlEvents:UIControlEventEditingChanged];
    }
    else if([view isKindOfClass:[UITextView class]])
    {
        UITextView * utv = (UITextView *)self.pText;
        [utv setDelegate:self];
    }
}

-(void)setRule:(bool (^)(void))block
{
    self.pBlock = block;
}

-(void)setFlashView:(UITableViewCell *)view
{
    self.pCell = view;
}

-(void)setEnabled:(bool)on
{
    self.pEnabled = on;
    [self check];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self check];
}


-(BOOL)check
{
    if(self.pEnabled)
    {
        self.pValid = false;
        if(self.pBlock())
        {
            self.pValid = true;
            [UIHelper stopFlashCell:self.pCell];
        }
        else if(!self.pFlashing)
        {
            [UIHelper flashCell:self.pCell];
        }
    }
    else if(self.pFlashing)
    {
        [UIHelper stopFlashCell:self.pCell];
        self.pFlashing = false;
    }
}

-(bool)isValid
{
    return self.pValid;
}


@end
