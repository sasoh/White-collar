//
//  GameSceneViewController.m
//  White collar
//
//  Created by Alexander Popov on 2/10/15.
//  Copyright (c) 2015 -. All rights reserved.
//

#import "GameSceneViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

// TODO: Move to a protocol definition file
typedef NS_ENUM(NSInteger, UIButtonTag) {
    UIButtonTagLeft     = 0,
    UIButtonTagRight    = 1,
    UIButtonTagAction   = 2
};

@interface GameSceneViewController ()

@end

@implementation GameSceneViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    SKView *spriteView = (SKView *)self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    GameScene *gameScene = [[GameScene alloc] initWithSize:[UIScreen mainScreen].bounds.size];
    SKView *spriteView = (SKView *)self.view;
    [spriteView presentScene:gameScene];

}

- (IBAction)didPressButton:(id)sender
{
    
    NSInteger tag = [sender tag];
    
    if (tag == UIButtonTagLeft) {
        NSLog(@"Left!");
    } else if (tag == UIButtonTagRight) {
        NSLog(@"Right!");
    } else if (tag == UIButtonTagAction) {
        NSLog(@"Action!");
    }
    
}

@end
