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

@interface GameScene ()

@property (nonatomic, assign) BOOL initialized;

- (void)createSceneContents;
- (void)createMap;

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
    
}

- (void)createMap
{

    JSTileMap *map = [JSTileMap mapNamed:@"level1.tmx"];
    if (map != nil) {
        [self addChild:map];
    } else {
        DDLogInfo(@"Failed loading map.");
    }
    
}

@end
