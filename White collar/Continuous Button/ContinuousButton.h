//
//  ContinuousButton.h
//  White collar
//
//  Created by Alexander Popov on 2/16/15.
//  Copyright (c) 2015 -. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ContinuousButtonTag) {
    ContinuousButtonTagNone     = 0,
    ContinuousButtonTagLeft     = 1,
    ContinuousButtonTagRight    = 2,
    ContinuousButtonTagAction   = 3
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
