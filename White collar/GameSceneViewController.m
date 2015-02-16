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
#import "ContinuousButton.h"

@interface GameSceneViewController ()

@property (nonatomic, strong) IBOutletCollection(ContinuousButton) NSArray *buttons;

@property (nonatomic, strong) GameScene *gameScene;

//! @brief Configures game scene object & presents it in the SKView
- (void)configureGameScene;

//! @brief Sets the game scene as delegate for input from buttons
- (void)configureButtons;

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

    [self configureGameScene];
    
    [self configureButtons];

}

- (void)configureGameScene
{
    
    self.gameScene = [[GameScene alloc] initWithSize:[UIScreen mainScreen].bounds.size];
    SKView *spriteView = (SKView *)self.view;
    [spriteView presentScene:self.gameScene];
    
}

- (void)configureButtons
{
    
    for (ContinuousButton *button in self.buttons) {
        [button setDelegate:self.gameScene];
    }
    
}

@end
