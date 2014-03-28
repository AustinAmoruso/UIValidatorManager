//
//  UIValidatorManager.m
//  SnapBi
//
//  Created by Austin Amoruso on 3/28/14.
//  Copyright (c) 2014 SnapBi. All rights reserved.
//

#import "UIValidatorManager.h"
#import "UITextValidator.h"

@interface UIValidatorManager()

@property (strong,atomic) NSMutableArray * pValidators;

@end

@implementation UIValidatorManager

-(id)init
{
    self = [super init];
    if(self)
    {
        self.pValidators = [NSMutableArray new];
    }
    return self;
}

-(void)addValidator:(id<UIValidatorDelegate>)delegate
{
    [self.pValidators addObject:delegate];
}

-(void)removeValidator:(id<UIValidatorDelegate>)delegate
{
    [self.pValidators removeObject:delegate];
}

-(void)setEnableed:(BOOL)on
{
    for(id<UIValidatorDelegate> uvd in self.pValidators)
    {
        [uvd setEnabled:on];
    }
}

-(void)createValidator:(UIView *)view flash:(UIView *)flash rule:(bool (^)(void))block
{
    if(([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]) && [flash isKindOfClass:[UITableViewCell class]])
    {
        UITextValidator * temp = [UITextValidator new];
        [temp setTextView:view];
        [temp setFlashView:(UITableViewCell *)flash];
        [temp setRule:block];
        [self.pValidators addObject:temp];
    }
    else
    {
        @throw([NSException exceptionWithName:@"Invalid Type" reason:@"View for flash not acceaptable type" userInfo:nil]);
    }
}

-(bool)isValid
{
    for(id<UIValidatorDelegate> uvd in self.pValidators)
    {
        if(![uvd isValid])
        {
            return false;
        }
    }
    return true;
}
@end
