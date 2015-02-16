//
//  GameScene.m
//  White collar
//
//  Created by Alexander Popov on 2/15/15.
//  Copyright (c) 2015 -. All rights reserved.
//

#import "GameScene.h"
#import "JSTileMap.h"
#import "DDLog.h"
#import "Player.h"

@interface GameScene ()

@property (nonatomic, assign) BOOL initialized;
@property (nonatomic, strong) JSTileMap *map;
@property (nonatomic, strong) Player *player;
@property (nonatomic, assign) NSTimeInterval previousUpdateTime;
@property (nonatomic, assign) CGPoint movementDirection;

- (void)createSceneContents;
- (void)createMap;
- (void)createPlayer;
- (void)updateViewPosition:(NSTimeInterval)delta;

@end

@implementation GameScene

- (void)didMoveToView: (SKView *) view
{
 
    if (self.initialized == NO)
    {
        [self createSceneContents];
        self.initialized = YES;
    }
    
}

- (void)createSceneContents
{
    
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self createMap];
    [self createPlayer];
    
}

- (void)createMap
{

    self.movementDirection = CGPointZero;
    
    self.map = [JSTileMap mapNamed:@"map1.tmx"];
    if (self.map != nil) {
        [self addChild:self.map];
    } else {
        DDLogInfo(@"Failed loading map.");
    }
    
}

- (void)createPlayer
{
    
    self.player = [[Player alloc] initWithImageNamed:@"sprite_valeri.png"];
    self.player.position = CGPointMake(200, 90);
    self.player.zPosition = 15;
    [self.map addChild:self.player];
    
}

- (void)update:(NSTimeInterval)currentTime
{
    
    NSTimeInterval delta = currentTime - self.previousUpdateTime;
    
    // limit delta time so there are no larger time stamps
    if (delta > 0.02) {
        delta = 0.02;
    }
    
    self.previousUpdateTime = currentTime;
    
    [self updateViewPosition:delta];
    
}

- (void)updateViewPosition:(NSTimeInterval)delta
{
    
    CGPoint mapPosition = self.map.position;
    mapPosition.x += self.movementDirection.x * delta;
    self.map.position = mapPosition;
    
    CGPoint playerPosition = self.player.position;
    playerPosition.x -= self.movementDirection.x * delta;
    self.player.position = playerPosition;
    
    
}

#pragma mark - Continuous button actions
- (void)didBeginTouchOnContinuousButton:(ContinuousButton *)button
{
    
    static const CGFloat offsetPerSecond = 150.0f; // sample value
    
    ContinuousButtonTag tag = (ContinuousButtonTag)[button tag];
    if (tag == ContinuousButtonTagLeft) {
        self.movementDirection = CGPointMake(offsetPerSecond, 0.0f);
    } else if (tag == ContinuousButtonTagRight) {
        self.movementDirection = CGPointMake(-offsetPerSecond, 0.0f);
    } else if (tag == ContinuousButtonTagAction) {
        NSLog(@"Action started.");
    }
    
}

- (void)didEndTouchOnContinuousButton:(ContinuousButton *)button
{
    
    ContinuousButtonTag tag = (ContinuousButtonTag)[button tag];
    if (tag == ContinuousButtonTagLeft) {
        self.movementDirection = CGPointZero;
    } else if (tag == ContinuousButtonTagRight) {
        self.movementDirection = CGPointZero;
    } else if (tag == ContinuousButtonTagAction) {
        NSLog(@"Action stopped.");
    }
    
}

@end
