//
//  PaddleGameViewController.m
//  PaddleGame
//
//  Created by Ivanna Peña on 3/24/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "PaddleGameViewController.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>
#import <Foundation/Foundation.h>


@interface PaddleGameViewController ()
@property (weak, nonatomic) IBOutlet UIView *paddleGameView;
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UIImageView *gamePaddle;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigation;
@property float random;
@property int currentScore;
@property Boolean started;
@property Boolean scoreChanged;
@end

@implementation PaddleGameViewController
-(void)back:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    if(_timer){
        [_timer invalidate];
         _timer = nil;
    }
}
- (void)loadView {
    [ super loadView ];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *BackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    _navigation.leftBarButtonItem=BackButton;
    //start game
    _started = YES;
    _scoreboardLabel.text = @"Score:";
    _savedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    //updates score
    if (_savedScore != 0) {
        _scoreLabel.text = [NSString stringWithFormat:@"%li", (long)_savedScore];
        _currentScore = (int) _savedScore;
    }else {
        _scoreLabel.text = @"0";
        _currentScore = 0;
    }
    //sets up ball for game
    _balldirection = CGPointMake(-1.0, -1.0);
    //starts ball at random location
    _random = arc4random_uniform(self.paddleGameView.frame.size.width);
    _ball.layer.position = CGPointMake(_random, 180);
    [ self.paddleGameView.layer addSublayer: _ball.layer ];
        
    //sets up paddle for game
    _paddledirection = CGPointMake(-1.0, -1.0);
    _gamePaddle.layer.position = CGPointMake(210 , 610);
    [ self.paddleGameView.layer addSublayer: _gamePaddle.layer ];
    //starts timer
    _timer = [ NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(handleTimer:) userInfo: nil repeats: YES];
}
//for ball to move consistently
- (void) handleTimer: (NSTimer *) timer {
    CGPoint origin;
    //if you have just started playing the game
    if (_started) {
        _balldirection.y = 1.0;
        _started = NO;
    }
    _random = arc4random_uniform(self.paddleGameView.frame.size.width);
    //ball hits left wall
    if (_ball.layer.position.x <=
        ( (68 / 2) + 1) - self.paddleGameView.frame.origin.x)
        //bounce
        _balldirection.x = 1.0;
    //ball hits right wall
    if (_ball.layer.position.x + (68.0 / 2) + 1 >=
        (self.paddleGameView.frame.size.width - self.paddleGameView.frame.origin.x) - 1)
        //bounce
        _balldirection.x = -1.0;
    //ball hits ceiling
    if (_ball.layer.position.y <= (70.0 / 2) )
        //bounce
        _balldirection.y = 1.0;
    
    //if ball hits the paddle
    if (_ball.layer.position.y + (70.0 / 2) + 1 == (595)) {
        //ball hits the paddle
        if (CGRectIntersectsRect(_ball.layer.frame, _gamePaddle.layer.frame)) {
            _balldirection.y = -1.0;
            //score goes up
            _currentScore =  _currentScore + 1;
            _scoreLabel.text = [NSString stringWithFormat:@"%i", _currentScore];
            _scoreChanged = YES;
        }
    }
    //if ball goes beyond paddle
    if (_ball.layer.position.y + (70.0 / 2) + 1 >= (630)) {
        origin = _ball.layer.position;
        origin.x = _random;
        origin.y = 180;
        _ball.layer.position = origin;
    }
    //if ball is moving
    origin = _ball.layer.position;
    origin.x += _balldirection.x;
    origin.y += _balldirection.y;
    _ball.layer.position = origin;
    //update score
    if (_scoreChanged == YES) {
        [[NSUserDefaults standardUserDefaults] setInteger:_currentScore forKey:@"HighScore"];
        _savedScore = _currentScore;
        _scoreChanged = NO;
    }
}
//moves paddle to left if left arrow clicked
- (IBAction)leftClicked:(id)sender {
    int paddleCenterPoint = _gamePaddle.layer.position.x;
    CGPoint position = _gamePaddle.layer.position;

    if (paddleCenterPoint > 56) {
        _paddledirection.x = 1.0;
        position.x -= 25.0;
        _gamePaddle.layer.position = position;
    }
}
//moves paddle to right if right arrow is clicked
- (IBAction)rightClicked:(id)sender {
    int paddleCenterPoint = _gamePaddle.layer.position.x;
    CGPoint position = _gamePaddle.layer.position;

    if (paddleCenterPoint < self.paddleGameView.frame.size.width - 56) {
        _paddledirection.x = 1.0;
        position.x += 25.0;
        _gamePaddle.layer.position = position;
    }
    
}

@end


