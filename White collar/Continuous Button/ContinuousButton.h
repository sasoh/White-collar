//
//  ContinuousButton.h
//  White collar
//
//  Created by Alexander Popov on 2/16/15.
//  Copyright (c) 2015 -. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonTag) {
    UIButtonTagNone     = 0,
    UIButtonTagLeft     = 1,
    UIButtonTagRight    = 2,
    UIButtonTagAction   = 3
};

@class ContinuousButton;

@protocol ContinuousButtonDelegate <NSObject>

@optional
- (void)didBeginTouchOnContinuousButton:(ContinuousButton *)button;
- (void)didEndTouchOnContinuousButton:(ContinuousButton *)button;

@end

@interface ContinuousButton : UIImageView

@property (nonatomic, weak) id <ContinuousButtonDelegate> delegate;

@end
