//
//  ContinuousButton.m
//  White collar
//
//  Created by Alexander Popov on 2/16/15.
//  Copyright (c) 2015 -. All rights reserved.
//

#import "ContinuousButton.h"

@implementation ContinuousButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    SEL selector = @selector(didBeginTouchOnContinuousButton:);
    if ([self.delegate respondsToSelector:selector] == YES) {
        [self.delegate didBeginTouchOnContinuousButton:self];
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    SEL selector = @selector(didEndTouchOnContinuousButton:);
    if ([self.delegate respondsToSelector:selector] == YES) {
        [self.delegate didEndTouchOnContinuousButton:self];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    SEL selector = @selector(didEndTouchOnContinuousButton:);
    if ([self.delegate respondsToSelector:selector] == YES) {
        [self.delegate didEndTouchOnContinuousButton:self];
    }
    
}

@end
