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

- (void)createSceneContents;
- (void)createMap;
- (void)createPlayer;

@end

@implementation GameScene

- (void)didMoveToView: (SKView *) view
{
 
    if (self.initialized == NO)
    {
        [self createSceneContents];
        _initialized = YES;
    }
    
}

- (void)createSceneContents
{
    
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self createMap];
    [self createPlayer];
    
}

- (void)createMap
{

    self.map = [JSTileMap mapNamed:@"level1.tmx"];
    if (self.map != nil) {
        [self addChild:self.map];
    } else {
        DDLogInfo(@"Failed loading map.");
    }
    
}

- (void)createPlayer
{
    
    self.player = [[Player alloc] initWithImageNamed:@"koalio_stand.png"];
    self.player.position = CGPointMake(200, 50);
    self.player.zPosition = 15;
    [self.map addChild:self.player];
    
}

@end
